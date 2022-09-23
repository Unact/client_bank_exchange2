# ClientBankExchange2

Библиотека для работы с документами в формате [1CClientBankExchange 1.0.3](https://v8.1c.ru/tekhnologii/obmen-dannymi-i-integratsiya/standarty-i-formaty/standart-obmena-s-sistemami-klient-banka/formaty-obmena/).  
Позволяет как парсить, так и создавать документы.

## Установка

В Gemfile указать `gem 'client_bank_exchange2', github: 'Unact/client_bank_exchange2'`

## Использование

Для парсинга документа

```ruby
file_content = File.read("some/path/to/file")
ClientBankExchange2.parse(file_content)
```

Для создания документа

```ruby
document_date = Date.today
account_number = "00000000000000000000"
exchange_file = ClientBankExchange2::Models::ExchangeFile.new(
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
      type: "Платежное поручение",
      number: "1",
      date: document_date,
      sum: BigDecimal("100"),
      payer_account_number: account_number,
      payer_inn: "000000000000",
      receiver_account_number: "00000000000000000001",
      receiver_inn: "000000000000"
    )
  ]
)
ClientBankExchange2.build(exchange_file)
```

## Разработка

Для разработки используйте `bundle install` чтобы установить все необходимые зависимости  
После чего можно использовать команды `rake` для `rspec` и `rubocop`
