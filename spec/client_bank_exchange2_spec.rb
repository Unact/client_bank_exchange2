# frozen_string_literal: true

RSpec.describe ClientBankExchange2 do
  context "#parse" do
    let(:text) do
      file_path = File.join(File.dirname(__FILE__), "data/test.txt")
      File.read(file_path)
    end

    it "should return parsed model" do
      result = described_class.parse(text)

      expect(result).to be_an_instance_of(ClientBankExchange2::Models::ExchangeFile)
    end
  end

  context "#build" do
    let(:exchange_file) do
      document_date = Date.today - 1
      account_number = "40700000000000000000"
      ClientBankExchange2::Models::ExchangeFile.new(
        header: ClientBankExchange2::Models::Header.new(
          filter_date_from: document_date,
          filter_date_to: document_date,
          filter_account_numbers: [account_number],
          filter_document_types: []
        ),
        balances: [
          ClientBankExchange2::Models::Balance.new(
            date_from: document_date,
            date_to: document_date,
            account_number: account_number
          )
        ],
        documents: [
          ClientBankExchange2::Models::Document.new(
            type: "Some type",
            number: "1",
            date: document_date,
            sum: BigDecimal(100, 2),
            payer_account_number: account_number,
            payer_inn: "000000000000",
            receiver_account_number: "40600000000000000000",
            receiver_inn: "000000000000"
          )
        ]
      )
    end

    it "should return built text" do
      result = described_class.build(exchange_file)

      expect(result).to be_an_instance_of(String)
    end
  end
end
