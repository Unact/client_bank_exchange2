# frozen_string_literal: true

RSpec.describe ClientBankExchange2::Models::Balance do
  context "#new" do
    let(:date_from) { Date.today }
    let(:date_to) { Date.today + 1 }
    let(:account_number) { "40700000000000000000" }
    let(:initial_balance) { BigDecimal(0, 2) }
    let(:total_income) { BigDecimal(3, 2) }
    let(:total_expense) { BigDecimal(2, 2) }
    let(:final_balance) { BigDecimal(1, 2) }

    it "should correctly build" do
      balance = ClientBankExchange2::Models::Balance.new(
        date_from: date_from,
        date_to: date_to,
        account_number: account_number,
        initial_balance: initial_balance,
        total_income: total_income,
        total_expense: total_expense,
        final_balance: final_balance
      )

      expect(balance.date_from).to eq(date_from)
      expect(balance.date_to).to eq(date_to)
      expect(balance.account_number).to eq(account_number)
      expect(balance.initial_balance).to eq(initial_balance)
      expect(balance.total_income).to eq(total_income)
      expect(balance.total_expense).to eq(total_expense)
      expect(balance.final_balance).to eq(final_balance)
    end

    it "should correctly build when optional attributes are nil" do
      balance = ClientBankExchange2::Models::Balance.new(
        date_from: date_from,
        date_to: date_to,
        account_number: account_number,
        initial_balance: nil,
        total_income: nil,
        total_expense: nil,
        final_balance: nil
      )

      expect(balance.initial_balance).to be_nil
      expect(balance.total_income).to be_nil
      expect(balance.total_expense).to be_nil
      expect(balance.final_balance).to be_nil
    end

    it "should correctly build when optional attributes are ommited" do
      balance = ClientBankExchange2::Models::Balance.new(
        date_from: date_from,
        date_to: date_to,
        account_number: account_number
      )

      expect(balance.initial_balance).to be_nil
      expect(balance.total_income).to be_nil
      expect(balance.total_expense).to be_nil
      expect(balance.final_balance).to be_nil
    end
  end
end
