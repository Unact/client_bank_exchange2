# frozen_string_literal: true

require "bigdecimal"

require "dry-struct"

require_relative "client_bank_exchange2/models/types"
require_relative "client_bank_exchange2/models/balance"
require_relative "client_bank_exchange2/models/document"
require_relative "client_bank_exchange2/models/header"
require_relative "client_bank_exchange2/models/exchange_file"
require_relative "client_bank_exchange2/value_converter"
require_relative "client_bank_exchange2/text_converter"
require_relative "client_bank_exchange2/builder"
require_relative "client_bank_exchange2/parser"
require_relative "client_bank_exchange2/version"

# Main module for parsing/building documents
module ClientBankExchange2
  CRLF = "\r\n"
  LF = "\n"

  # Parses a document with the following format
  # https://v8.1c.ru/tekhnologii/obmen-dannymi-i-integratsiya/standarty-i-formaty/standart-obmena-s-sistemami-klient-banka/formaty-obmena/
  #
  # @param file_content [String] data to parse
  # @return [Models::ExchangeFile] parsed data
  def self.parse(file_content)
    Parser.new(file_content.gsub(CRLF, LF), Models::ExchangeFile).call
  end

  # Creates a document with the following format
  # https://v8.1c.ru/tekhnologii/obmen-dannymi-i-integratsiya/standarty-i-formaty/standart-obmena-s-sistemami-klient-banka/formaty-obmena/
  #
  # @param exchange_file [Models::ExchangeFile] data to build
  # @return [String] converted data
  def self.build(exchange_file)
    Builder.new(exchange_file).call.gsub(LF, CRLF)
  end
end
