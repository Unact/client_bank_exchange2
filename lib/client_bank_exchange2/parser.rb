# frozen_string_literal: true

module ClientBankExchange2
  # @private
  class Parser
    def initialize(parse_text, model_class)
      @parse_text = parse_text
      @model_class = model_class
    end

    def call
      matched = @parse_text.scan(@model_class.const_get(:REGEX))

      return nil if matched.empty?

      attributes = @model_class.schema.keys.each_with_object({}) do |key, acc|
        acc[key.name] = TextConverter.new(key.type, matched[0], key.meta[:tag_name]).call
      end

      @model_class.new(attributes)
    end
  end
end
