# frozen_string_literal: true

module ClientBankExchange2
  # @private
  class TextConverter
    def initialize(key_type, text, tag_name)
      @key_type = key_type
      @text = text
      @tag_name = tag_name
      @type_name = @key_type.optional? ? @key_type.right.name : @key_type.name
    end

    def call
      return if @text.empty?

      case @type_name
      when /String/ then text_to_string
      when /Integer/ then text_to_integer
      when /Decimal/ then text_to_decimal
      when /Date/ then text_to_date
      when /Time/ then text_to_time
      when /Array/ then text_to_array
      else text_to_model
      end
    end

    private

    def text_to_string
      value_from_line(@text, @tag_name)
    end

    def text_to_decimal
      value = value_from_line(@text, @tag_name)

      return unless value

      BigDecimal(value)
    end

    def text_to_integer
      value = value_from_line(@text, @tag_name)

      return unless value

      Integer(value)
    end

    def text_to_date
      value = value_from_line(@text, @tag_name)

      return unless value

      Date.parse(value)
    end

    def text_to_time
      value = value_from_line(@text, @tag_name)

      return unless value

      Time.parse(value)
    end

    def text_to_array
      sub_key_type = @key_type.type.member
      sub_type_name = sub_key_type.name
      matched =
        case sub_type_name
        when /(String)|(Integer)|(Decimal)|(Date)|(Time)/
          @text.scan(/#{@tag_name}.+/)
        else
          value_model = Module.const_get(sub_type_name)
          @text.scan(/#{value_model.const_get(:START_TAG)}[\s\S]*?#{value_model.const_get(:END_TAG)}/)
        end

      matched.map { |v| TextConverter.new(sub_key_type, v, @tag_name).call }
    end

    def text_to_model
      Parser.new(@text, Module.const_get(@type_name)).call
    end

    def value_from_line(text, name)
      matched = text.match(/(?<=#{name}=).+/)

      return unless matched

      matched[0]
    end
  end
end
