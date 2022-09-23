# frozen_string_literal: true

module ClientBankExchange2
  # @private
  class ValueConverter
    def initialize(key_type, value, tag_name)
      @key_type = key_type
      @value = value
      @tag_name = tag_name
      @type_name = @key_type.optional? ? @key_type.right.name : @key_type.name
    end

    def call
      return "" if @value.nil?

      case @type_name
      when /String/ then string_to_text
      when /Integer/ then integer_to_text
      when /Decimal/ then decimal_to_text
      when /Date/ then date_to_text
      when /Time/ then time_to_text
      when /Array/ then array_to_text
      else model_to_text
      end
    end

    private

    def string_to_text
      value_to_line(@value, @tag_name)
    end

    def decimal_to_text
      value_to_line(format("%.2f", @value.truncate(2)), @tag_name)
    end

    def integer_to_text
      value_to_line(@value, @tag_name)
    end

    def date_to_text
      value_to_line(@value.strftime("%d.%m.%Y"), @tag_name)
    end

    def time_to_text
      value_to_line(@value.strftime("%H:%M:%S"), @tag_name)
    end

    def array_to_text
      @value.map { |v| ValueConverter.new(@key_type.type.member, v, @tag_name).call }.join(LF)
    end

    def model_to_text
      Builder.new(@value).call
    end

    def value_to_line(value, name)
      "#{name}=#{value}"
    end
  end
end
