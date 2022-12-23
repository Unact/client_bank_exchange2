# frozen_string_literal: true

RSpec.describe ClientBankExchange2::Models::ExchangeFile do
  context "#new" do
    let(:document_date) { Date.today }
    let(:account_number) { "40700000000000000000" }
    let(:header) do
      ClientBankExchange2::Models::Header.new(
        filter_date_from: document_date,
        filter_date_to: document_date,
        filter_account_numbers: [account_number],
        filter_document_types: []
      )
    end
    let(:balances) do
      [
        ClientBankExchange2::Models::Balance.new(
          date_from: document_date,
          date_to: document_date,
          account_number: account_number
        )
      ]
    end
    let(:documents) do
      [
        ClientBankExchange2::Models::Document.new(
          type: "Some type",
          number: "1",
          date: document_date,
          sum: BigDecimal(100, 2)
        )
      ]
    end

    it "should correctly build" do
      exchange_file = ClientBankExchange2::Models::ExchangeFile.new(
        header: header,
        balances: balances,
        documents: documents
      )

      expect(exchange_file.header).to eq(header)
      expect(exchange_file.balances).to eq(balances)
      expect(exchange_file.documents).to eq(documents)
    end
  end
end
