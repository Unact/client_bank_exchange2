# frozen_string_literal: true

require_relative "lib/client_bank_exchange2/version"

Gem::Specification.new do |spec|
  spec.name = "client_bank_exchange2"
  spec.version = ClientBankExchange2::VERSION
  spec.authors = ["Unact"]
  spec.email = ["it@unact.ru"]

  spec.summary = "A library to parse and build documents with 1CClientBankExchange format"
  spec.homepage = "https://github.com/Unact/client_bank_exchange2"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = `git ls-files README.md CHANGELOG.md LICENSE.txt lib`.split
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-struct"

  spec.metadata["rubygems_mfa_required"] = "true"
end
