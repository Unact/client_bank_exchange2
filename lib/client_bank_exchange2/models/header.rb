# frozen_string_literal: true

require_relative "../version"

module ClientBankExchange2
  module Models
    # Общие сведения
    class Header < Dry::Struct
      ENCODING = "Windows"
      FORMAT_VERSION = "1.03"
      SENDER = "client_bank_exchange2/#{ClientBankExchange2::VERSION}"
      RECEIVER = "External program"

      START_TAG = nil
      END_TAG = nil
      REGEX = /(?<=\n)[\s\S]+?(?=СекцияРасчСчет)/.freeze

      attribute :format_version, Types::String.default(FORMAT_VERSION).meta(tag_name: "ВерсияФормата")
      attribute :encoding, Types::String.default(ENCODING).meta(tag_name: "Кодировка")
      attribute :sender, Types::String.default(SENDER.freeze).meta(tag_name: "Отправитель")
      attribute :receiver, Types::String.default(RECEIVER).meta(tag_name: "Получатель")
      attribute :creation_date?, Types::Date.optional.meta(tag_name: "ДатаСоздания")
      attribute :creation_time?, Types::Time.optional.meta(tag_name: "ВремяСоздания")

      attribute :filter_date_from, Types::Date.meta(tag_name: "ДатаНачала")
      attribute :filter_date_to, Types::Date.meta(tag_name: "ДатаКонца")
      attribute :filter_account_numbers, Types::Array.of(Types::String).meta(tag_name: "РасчСчет")
      attribute :filter_document_types, Types::Array.of(Types::String).meta(tag_name: "Документ")
    end
  end
end
