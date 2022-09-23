# frozen_string_literal: true

module ClientBankExchange2
  module Models
    # Файл обмена
    class ExchangeFile < Dry::Struct
      START_TAG = "1CClientBankExchange"
      END_TAG = "КонецФайла"
      REGEX = /[\S\s]+/.freeze

      attribute :header, Header
      attribute :balances, Types::Array.of(Balance)
      attribute :documents, Types::Array.of(Document)
    end
  end
end
