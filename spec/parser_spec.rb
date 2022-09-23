# frozen_string_literal: true

RSpec.describe ClientBankExchange2::Parser do
  context "#call" do
    it "should correctly parse" do
      parse_text = <<~TEXT
        СекцияРасчСчет
        ДатаНачала=20.09.2022
        ДатаКонца=22.09.2022
        РасчСчет=40700000000000000000
        НачальныйОстаток=0.00
        ВсегоПоступило=15.01
        ВсегоСписано=10.00
        КонечныйОстаток=5.01
        КонецРасчСчет
      TEXT
      result = described_class.new(parse_text, ClientBankExchange2::Models::Balance).call

      expect(result.date_from).to eq(Date.new(2022, 9, 20))
      expect(result.date_to).to eq(Date.new(2022, 9, 22))
      expect(result.account_number).to eq("40700000000000000000")
      expect(result.initial_balance).to eq(BigDecimal("0"))
      expect(result.total_income).to eq(BigDecimal("15.01"))
      expect(result.total_expense).to eq(BigDecimal("10"))
      expect(result.final_balance).to eq(BigDecimal("5.01"))
    end

    it "should return nil if nothing found" do
      result = described_class.new("", ClientBankExchange2::Models::Balance).call

      expect(result).to be_nil
    end

    it "should always parse into same model" do
      parse_text = <<~TEXT
        СекцияРасчСчет
        ДатаНачала=20.09.2022
        ДатаКонца=22.09.2022
        РасчСчет=40700000000000000000
        КонецРасчСчет
      TEXT
      result1 = described_class.new(parse_text, ClientBankExchange2::Models::Balance).call
      result2 = described_class.new(parse_text, ClientBankExchange2::Models::Balance).call

      expect(result1).to eq(result2)
    end
  end
end
