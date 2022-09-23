# frozen_string_literal: true

module ClientBankExchange2
  module Models
    # Секция платежного документа
    class Document < Dry::Struct
      START_TAG = nil
      END_TAG = "КонецДокумента"
      REGEX = /(?=СекцияДокумент)[\s\S]+?(?=КонецДокумента)/.freeze

      attribute :type, Types::String.meta(tag_name: "СекцияДокумент")
      attribute :number, Types::String.meta(tag_name: "Номер")
      attribute :date, Types::Date.meta(tag_name: "Дата")
      attribute :sum, Types::Decimal.meta(tag_name: "Сумма")

      attribute :receipt_date?, Types::Date.optional.meta(tag_name: "КвитанцияДата")
      attribute :receipt_time?, Types::Time.optional.meta(tag_name: "КвитанцияВремя")
      attribute :receipt_content?, Types::String.optional.meta(tag_name: "КвитанцияСодержание")

      attribute :payer_account_number, Types::String.meta(tag_name: "ПлательщикСчет")
      attribute :payer_date?, Types::Date.optional.meta(tag_name: "ДатаСписано")
      attribute :payer_name?, Types::String.optional.meta(tag_name: "Плательщик")
      attribute :payer_inn, Types::String.meta(tag_name: "ПлательщикИНН")
      attribute :payer_name1?, Types::String.optional.meta(tag_name: "Плательщик1")
      attribute :payer_name2?, Types::String.optional.meta(tag_name: "Плательщик2")
      attribute :payer_name3?, Types::String.optional.meta(tag_name: "Плательщик3")
      attribute :payer_name4?, Types::String.optional.meta(tag_name: "Плательщик4")
      attribute :payer_checking_number?, Types::String.optional.meta(tag_name: "ПлательщикРасчСчет")
      attribute :payer_bank_name?, Types::String.optional.meta(tag_name: "ПлательщикБанк1")
      attribute :payer_bank_city?, Types::String.optional.meta(tag_name: "ПлательщикБанк2")
      attribute :payer_bank_bic?, Types::String.optional.meta(tag_name: "ПлательщикБИК")
      attribute :payer_bank_checking_number?, Types::String.optional.meta(tag_name: "ПлательщикКорсчет")

      attribute :receiver_account_number, Types::String.meta(tag_name: "ПолучательСчет")
      attribute :receiver_date?, Types::Date.optional.meta(tag_name: "ДатаПоступило")
      attribute :receiver_name?, Types::String.optional.meta(tag_name: "Получатель")
      attribute :receiver_inn, Types::String.meta(tag_name: "ПолучательИНН")
      attribute :receiver_name1?, Types::String.optional.meta(tag_name: "Получатель1")
      attribute :receiver_name2?, Types::String.optional.meta(tag_name: "Получатель2")
      attribute :receiver_name3?, Types::String.optional.meta(tag_name: "Получатель3")
      attribute :receiver_name4?, Types::String.optional.meta(tag_name: "Получатель4")
      attribute :receiver_checking_number?, Types::String.optional.meta(tag_name: "ПолучательРасчСчет")
      attribute :receiver_bank_name?, Types::String.optional.meta(tag_name: "ПолучательБанк1")
      attribute :receiver_bank_city?, Types::String.optional.meta(tag_name: "ПолучательБанк2")
      attribute :receiver_bank_bic?, Types::String.optional.meta(tag_name: "ПолучательБИК")
      attribute :receiver_bank_checking_number?, Types::String.optional.meta(tag_name: "ПолучательКорсчет")

      attribute :payment_type?, Types::String.optional.meta(tag_name: "ВидПлатежа")
      attribute :payment_purpose_code?, Types::String.optional.meta(tag_name: "КодНазПлатежа")
      attribute :payment_operation_type?, Types::String.optional.meta(tag_name: "ВидОплаты")
      attribute :payment_code?, Types::String.optional.meta(tag_name: "Код")
      attribute :payment_purpose?, Types::String.optional.meta(tag_name: "НазначениеПлатежа")
      attribute :payment_purpose1?, Types::String.optional.meta(tag_name: "НазначениеПлатежа1")
      attribute :payment_purpose2?, Types::String.optional.meta(tag_name: "НазначениеПлатежа2")
      attribute :payment_purpose3?, Types::String.optional.meta(tag_name: "НазначениеПлатежа3")
      attribute :payment_purpose4?, Types::String.optional.meta(tag_name: "НазначениеПлатежа4")
      attribute :payment_purpose5?, Types::String.optional.meta(tag_name: "НазначениеПлатежа5")
      attribute :payment_purpose6?, Types::String.optional.meta(tag_name: "НазначениеПлатежа6")

      attribute :creator_status?, Types::String.optional.meta(tag_name: "СтатусСоставителя")
      attribute :payer_kpp?, Types::String.optional.meta(tag_name: "ПлательщикКПП")
      attribute :receiver_kpp?, Types::String.optional.meta(tag_name: "ПолучательКПП")
      attribute :kbk_index?, Types::String.optional.meta(tag_name: "ПоказательКБК")
      attribute :okato?, Types::String.optional.meta(tag_name: "ОКАТО")
      attribute :basis_index?, Types::String.optional.meta(tag_name: "ПоказательОснования")
      attribute :period_index?, Types::String.optional.meta(tag_name: "ПоказательПериода")
      attribute :number_index?, Types::String.optional.meta(tag_name: "ПоказательНомера")
      attribute :date_index?, Types::Date.optional.meta(tag_name: "ПоказательДаты")
      attribute :type_index?, Types::String.optional.meta(tag_name: "ПоказательТипа")

      attribute :priority?, Types::String.optional.meta(tag_name: "Очередность")
      attribute :accept_length?, Types::Integer.optional.meta(tag_name: "СрокАкцепта")
      attribute :letter_of_credit_type?, Types::String.optional.meta(tag_name: "ВидАккредитива")
      attribute :payment_until?, Types::Date.optional.meta(tag_name: "СрокПлатежа")
      attribute :payment_terms1?, Types::String.optional.meta(tag_name: "УсловиеОплаты1")
      attribute :payment_terms2?, Types::String.optional.meta(tag_name: "УсловиеОплаты2")
      attribute :payment_terms3?, Types::String.optional.meta(tag_name: "УсловиеОплаты3")
      attribute :payment_by_submission?, Types::String.optional.meta(tag_name: "ПлатежПоПредст")
      attribute :extra_terms?, Types::String.optional.meta(tag_name: "ДополнУсловия")
      attribute :supplier_account_number?, Types::String.optional.meta(tag_name: "НомерСчетаПоставщика")
      attribute :documents_send_date?, Types::Date.optional.meta(tag_name: "ДатаОтсылкиДок")
    end
  end
end
