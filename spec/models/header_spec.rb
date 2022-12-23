# frozen_string_literal: true

RSpec.describe ClientBankExchange2::Models::Header do
  context "#new" do
    let(:format_version) { "1" }
    let(:encoding) { "UTF-8" }
    let(:sender) { "TEST_SENDER" }
    let(:receiver) { "TEST_RECEIVER" }
    let(:creation_date) { creation_time.to_date }
    let(:creation_time) { Time.now }
    let(:filter_date_from) { Date.today }
    let(:filter_date_to) { Date.today + 1 }
    let(:filter_account_numbers) { %w[40700000000000000000 40700000000000000001] }
    let(:filter_document_types) { %w[TEST TEST2] }

    it "should correctly build" do
      header = ClientBankExchange2::Models::Header.new(
        format_version: format_version,
        encoding: encoding,
        sender: sender,
        receiver: receiver,
        creation_date: creation_date,
        creation_time: creation_time,
        filter_date_from: filter_date_from,
        filter_date_to: filter_date_to,
        filter_account_numbers: filter_account_numbers,
        filter_document_types: filter_document_types
      )

      expect(header.format_version).to eq(format_version)
      expect(header.encoding).to eq(encoding)
      expect(header.sender).to eq(sender)
      expect(header.receiver).to eq(receiver)
      expect(header.creation_date).to eq(creation_date)
      expect(header.creation_time).to eq(creation_time)
      expect(header.filter_date_from).to eq(filter_date_from)
      expect(header.filter_date_to).to eq(filter_date_to)
      expect(header.filter_account_numbers).to eq(filter_account_numbers)
      expect(header.filter_document_types).to eq(filter_document_types)
    end

    it "should correctly build when optional attributes are nil" do
      header = ClientBankExchange2::Models::Header.new(
        format_version: format_version,
        encoding: encoding,
        sender: nil,
        receiver: nil,
        creation_date: nil,
        creation_time: nil,
        filter_date_from: filter_date_from,
        filter_date_to: filter_date_to,
        filter_account_numbers: filter_account_numbers,
        filter_document_types: filter_document_types
      )

      expect(header.sender).to be_nil
      expect(header.receiver).to be_nil
      expect(header.creation_date).to be_nil
      expect(header.creation_time).to be_nil
    end

    it "should correctly build when optional attributes are ommited" do
      header = ClientBankExchange2::Models::Header.new(
        format_version: format_version,
        encoding: encoding,
        filter_date_from: filter_date_from,
        filter_date_to: filter_date_to,
        filter_account_numbers: filter_account_numbers,
        filter_document_types: filter_document_types
      )

      expect(header.sender).to eq(ClientBankExchange2::Models::Header::SENDER)
      expect(header.receiver).to eq(ClientBankExchange2::Models::Header::RECEIVER)
      expect(header.creation_date).to be_nil
      expect(header.creation_time).to be_nil
    end

    it "should correctly build default values" do
      header = ClientBankExchange2::Models::Header.new(
        filter_date_from: filter_date_from,
        filter_date_to: filter_date_to,
        filter_account_numbers: filter_account_numbers,
        filter_document_types: filter_document_types
      )

      expect(header.format_version).to eq(ClientBankExchange2::Models::Header::FORMAT_VERSION)
      expect(header.encoding).to eq(ClientBankExchange2::Models::Header::ENCODING)
      expect(header.sender).to eq(ClientBankExchange2::Models::Header::SENDER)
      expect(header.receiver).to eq(ClientBankExchange2::Models::Header::RECEIVER)
    end
  end
end
