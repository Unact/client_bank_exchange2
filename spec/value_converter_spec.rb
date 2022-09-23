# frozen_string_literal: true

RSpec.describe ClientBankExchange2::ValueConverter do
  context "#call" do
    let(:tag_name) { "SomeTag" }

    context "string" do
      it "should transform to text" do
        key_type = ClientBankExchange2::Types::String
        value = "SomeValue"
        expected_result = "#{tag_name}=#{value}"

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end
    end

    context "integer" do
      it "should transform to text" do
        key_type = ClientBankExchange2::Types::Integer
        value = 10
        expected_result = "#{tag_name}=#{value}"

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end
    end

    context "decimal" do
      it "should transform to text" do
        key_type = ClientBankExchange2::Types::Decimal
        value = BigDecimal("10.11")
        expected_result = "#{tag_name}=#{format("%.2f", value.truncate(2))}"

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end
    end

    context "date" do
      it "should transform to text" do
        key_type = ClientBankExchange2::Types::Date
        value = Date.new(2022, 9, 21)
        expected_result = "#{tag_name}=#{value.strftime("%d.%m.%Y")}"

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end
    end

    context "time" do
      it "should transform to text" do
        key_type = ClientBankExchange2::Types::Time
        value = Date.today.to_time
        expected_result = "#{tag_name}=#{value.strftime("%H:%M:%S")}"

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end
    end

    context "array" do
      it "should transform strings to text" do
        key_type = ClientBankExchange2::Types::Array.of(ClientBankExchange2::Types::String)
        value = ["Some value1", "Some value2"]
        expected_result = value.map { |v| "#{tag_name}=#{v}" }.join(ClientBankExchange2::LF)

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end

      it "should transform decimals to text" do
        key_type = ClientBankExchange2::Types::Array.of(ClientBankExchange2::Types::Decimal)
        value = [BigDecimal("1.01"), BigDecimal("1.02")]
        expected_result = value.map { |v| "#{tag_name}=#{format("%.2f", v.truncate(2))}" }.join(ClientBankExchange2::LF)

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end

      it "should transform integers to text" do
        key_type = ClientBankExchange2::Types::Array.of(ClientBankExchange2::Types::Integer)
        value = [1, 2]
        expected_result = value.map { |v| "#{tag_name}=#{v}" }.join(ClientBankExchange2::LF)

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end

      it "should transform dates to text" do
        key_type = ClientBankExchange2::Types::Array.of(ClientBankExchange2::Types::Date)
        value = [Date.new(2022, 9, 20), Date.new(2022, 9, 22)]
        expected_result = value.map { |v| "#{tag_name}=#{v.strftime("%d.%m.%Y")}" }.join(ClientBankExchange2::LF)

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end

      it "should transform times to text" do
        key_type = ClientBankExchange2::Types::Array.of(ClientBankExchange2::Types::Time)
        value = [Date.today.to_time, Date.today.to_time]
        expected_result = value.map { |v| "#{tag_name}=#{v.strftime("%H:%M:%S")}" }.join(ClientBankExchange2::LF)

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end

      it "should transform models to text" do
        document_date = Date.new(2022, 9, 20)
        account_number = "40700000000000000000"
        sum = BigDecimal("0")
        key_type = ClientBankExchange2::Types::Array.of(ClientBankExchange2::Models::Balance)
        value = [
          ClientBankExchange2::Models::Balance.new(
            date_from: document_date,
            date_to: document_date,
            account_number: account_number,
            initial_balance: sum,
            total_income: sum,
            total_expense: sum,
            final_balance: sum
          ),
          ClientBankExchange2::Models::Balance.new(
            date_from: document_date,
            date_to: document_date,
            account_number: account_number,
            initial_balance: sum,
            total_income: sum,
            total_expense: sum,
            final_balance: sum
          )
        ]
        expected_result = value.map { |v| ClientBankExchange2::Builder.new(v).call }.join(ClientBankExchange2::LF)

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end
    end

    context "model" do
      it "should transform to text" do
        sum = BigDecimal("0")
        key_type = ClientBankExchange2::Models::Balance
        value = ClientBankExchange2::Models::Balance.new(
          date_from: Date.new(2022, 9, 20),
          date_to: Date.new(2022, 9, 20),
          account_number: "40700000000000000000",
          initial_balance: sum,
          total_income: sum,
          total_expense: sum,
          final_balance: sum
        )
        expected_result = ClientBankExchange2::Builder.new(value).call

        expect(described_class.new(key_type, value, tag_name).call).to eq(expected_result)
      end
    end
  end
end
