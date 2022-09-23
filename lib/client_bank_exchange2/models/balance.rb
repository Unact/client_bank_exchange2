# frozen_string_literal: true

module ClientBankExchange2
  module Models
    # Секция передачи остатков по расчетному счету
    class Balance < Dry::Struct
      START_TAG = "СекцияРасчСчет"
      END_TAG = "КонецРасчСчет"
      REGEX = /(?<=СекцияРасчСчет\s)[\s\S]+?(?=КонецРасчСчет)/.freeze

      attribute :date_from, Types::Date.meta(tag_name: "ДатаНачала")
      attribute :date_to, Types::Date.meta(tag_name: "ДатаКонца")
      attribute :account_number, Types::String.meta(tag_name: "РасчСчет")
      attribute :initial_balance?, Types::Decimal.optional.meta(tag_name: "НачальныйОстаток")
      attribute :total_income?, Types::Decimal.optional.meta(tag_name: "ВсегоПоступило")
      attribute :total_expense?, Types::Decimal.optional.meta(tag_name: "ВсегоСписано")
      attribute :final_balance?, Types::Decimal.optional.meta(tag_name: "КонечныйОстаток")
    end
  end
end
