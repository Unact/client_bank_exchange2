# frozen_string_literal: true

RSpec.describe ClientBankExchange2::Builder do
  context "#call" do
    it "should correctly build" do
      model = ClientBankExchange2::Models::Balance.new(
        date_from: Date.new(2022, 9, 20),
        date_to: Date.new(2022, 9, 22),
        account_number: "40700000000000000000",
        initial_balance: BigDecimal("0"),
        total_income: BigDecimal("15.01"),
        total_expense: BigDecimal("10"),
        final_balance: BigDecimal("5.01")
      )
      result = described_class.new(model).call
      expected_text = <<~TEXT
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

      expect(result).to eq(expected_text)
    end

    it "should not include attribute if nil value" do
      model = ClientBankExchange2::Models::Balance.new(
        date_from: Date.new(2022, 9, 20),
        date_to: Date.new(2022, 9, 22),
        account_number: "40700000000000000000"
      )
      result = described_class.new(model).call
      expected_text = <<~TEXT
        СекцияРасчСчет
        ДатаНачала=20.09.2022
        ДатаКонца=22.09.2022
        РасчСчет=40700000000000000000
        КонецРасчСчет
      TEXT

      expect(result).to eq(expected_text)
    end

    it "should always build same model" do
      model = ClientBankExchange2::Models::Balance.new(
        date_from: Date.new(2022, 9, 20),
        date_to: Date.new(2022, 9, 22),
        account_number: "40700000000000000000"
      )
      result1 = described_class.new(model).call
      result2 = described_class.new(model).call

      expect(result1).to eq(result2)
    end
  end
end
