# frozen_string_literal: true

module ClientBankExchange2
  # @private
  class Builder
    def initialize(model_instance)
      @model_instance = model_instance
    end

    def call
      text = @model_instance.class.schema.keys.map do |schema_key|
        ValueConverter.new(schema_key.type, @model_instance.send(schema_key.name), schema_key.meta[:tag_name]).call
      end

      [
        @model_instance.class.const_get(:START_TAG),
        *text,
        @model_instance.class.const_get(:END_TAG)
      ].compact.reject(&:empty?).join(LF) + LF
    end
  end
end
