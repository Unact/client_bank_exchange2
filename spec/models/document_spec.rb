# frozen_string_literal: true

RSpec.describe ClientBankExchange2::Models::Document do
  context "#new" do
    let(:type) { "Some type" }
    let(:number) { "1" }
    let(:date) { Date.today }
    let(:sum) { BigDecimal(100, 2) }
    let(:receipt_date) { receipt_time.to_date }
    let(:receipt_time) { Time.now }
    let(:receipt_content) { "Content" }
    let(:payer_account_number) { "" }
    let(:payer_date) { Date.today + 1 }
    let(:payer_name) { "Test payer" }
    let(:payer_inn) { "000000000000" }
    let(:payer_name1) { "Payer name 1" }
    let(:payer_name2) { "Payer name 2" }
    let(:payer_name3) { "Payer name 3" }
    let(:payer_name4) { "Payer name 4" }
    let(:payer_checking_number) { "40600000000000000001" }
    let(:payer_bank_name) { "Payer bank name" }
    let(:payer_bank_city) { "Payer bank city" }
    let(:payer_bank_bic) { "Payer bank bic" }
    let(:payer_bank_checking_number) { "40600000000000000002" }
    let(:receiver_account_number) { "30600000000000000000" }
    let(:receiver_date) { Date.today + 2 }
    let(:receiver_name) { "Test receiver" }
    let(:receiver_inn) { "0000000000" }
    let(:receiver_name1) { "Receiver name 1" }
    let(:receiver_name2) { "Receiver name 2" }
    let(:receiver_name3) { "Receiver name 3" }
    let(:receiver_name4) { "Receiver name 4" }
    let(:receiver_checking_number) { "30600000000000000001" }
    let(:receiver_bank_name) { "Receiver bank name" }
    let(:receiver_bank_city) { "Receiver bank city" }
    let(:receiver_bank_bic) { "Receiver bank bic" }
    let(:receiver_bank_checking_number) { "30600000000000000002" }
    let(:payment_type) { "Payment type" }
    let(:payment_purpose_code) { "Payment purpose code" }
    let(:payment_operation_type) { "Payment operation type" }
    let(:payment_code) { "Payment code" }
    let(:payment_purpose) { "Payment purpose" }
    let(:payment_purpose1) { "Payment purpose 1" }
    let(:payment_purpose2) { "Payment purpose 2" }
    let(:payment_purpose3) { "Payment purpose 3" }
    let(:payment_purpose4) { "Payment purpose 4" }
    let(:payment_purpose5) { "Payment purpose 5" }
    let(:payment_purpose6) { "Payment purpose 6" }
    let(:creator_status) { "Creator status" }
    let(:payer_kpp) { "4" }
    let(:receiver_kpp) { "3" }
    let(:kbk_index) { "KBK index" }
    let(:okato) { "OKATO" }
    let(:basis_index) { "Basis index" }
    let(:period_index) { "Period index" }
    let(:number_index) { "Number index" }
    let(:date_index) { "Date index" }
    let(:type_index) { "Type index" }
    let(:priority) { "Priority" }
    let(:accept_length) { 1 }
    let(:letter_of_credit_type) { "Letter of credit type" }
    let(:payment_until) { Date.today + 3 }
    let(:payment_terms1) { "Payment terms 1" }
    let(:payment_terms2) { "Payment terms 2" }
    let(:payment_terms3) { "Payment terms 3" }
    let(:payment_by_submission) { "Payment by submission" }
    let(:extra_terms) { "Some terms" }
    let(:supplier_account_number) { "20600000000000000000" }
    let(:documents_send_date) { Date.today + 4 }

    it "should correctly build" do
      document = ClientBankExchange2::Models::Document.new(
        type: type,
        number: number,
        date: date,
        sum: sum,
        receipt_date: receipt_date,
        receipt_time: receipt_time,
        receipt_content: receipt_content,
        payer_account_number: payer_account_number,
        payer_date: payer_date,
        payer_name: payer_name,
        payer_inn: payer_inn,
        payer_name1: payer_name1,
        payer_name2: payer_name2,
        payer_name3: payer_name3,
        payer_name4: payer_name4,
        payer_checking_number: payer_checking_number,
        payer_bank_name: payer_bank_name,
        payer_bank_city: payer_bank_city,
        payer_bank_bic: payer_bank_bic,
        payer_bank_checking_number: payer_bank_checking_number,
        receiver_account_number: receiver_account_number,
        receiver_date: receiver_date,
        receiver_name: receiver_name,
        receiver_inn: receiver_inn,
        receiver_name1: receiver_name1,
        receiver_name2: receiver_name2,
        receiver_name3: receiver_name3,
        receiver_name4: receiver_name4,
        receiver_checking_number: receiver_checking_number,
        receiver_bank_name: receiver_bank_name,
        receiver_bank_city: receiver_bank_city,
        receiver_bank_bic: receiver_bank_bic,
        receiver_bank_checking_number: receiver_bank_checking_number,
        payment_type: payment_type,
        payment_purpose_code: payment_purpose_code,
        payment_operation_type: payment_operation_type,
        payment_code: payment_code,
        payment_purpose: payment_purpose,
        payment_purpose1: payment_purpose1,
        payment_purpose2: payment_purpose2,
        payment_purpose3: payment_purpose3,
        payment_purpose4: payment_purpose4,
        payment_purpose5: payment_purpose5,
        payment_purpose6: payment_purpose6,
        creator_status: creator_status,
        payer_kpp: payer_kpp,
        receiver_kpp: receiver_kpp,
        kbk_index: kbk_index,
        okato: okato,
        basis_index: basis_index,
        period_index: period_index,
        number_index: number_index,
        date_index: date_index,
        type_index: type_index,
        priority: priority,
        accept_length: accept_length,
        letter_of_credit_type: letter_of_credit_type,
        payment_until: payment_until,
        payment_terms1: payment_terms1,
        payment_terms2: payment_terms2,
        payment_terms3: payment_terms3,
        payment_by_submission: payment_by_submission,
        extra_terms: extra_terms,
        supplier_account_number: supplier_account_number,
        documents_send_date: documents_send_date
      )

      expect(document.type).to eq(type)
      expect(document.number).to eq(number)
      expect(document.date).to eq(date)
      expect(document.sum).to eq(sum)
      expect(document.receipt_date).to eq(receipt_date)
      expect(document.receipt_time).to eq(receipt_time)
      expect(document.receipt_content).to eq(receipt_content)
      expect(document.payer_account_number).to eq(payer_account_number)
      expect(document.payer_date).to eq(payer_date)
      expect(document.payer_name).to eq(payer_name)
      expect(document.payer_inn).to eq(payer_inn)
      expect(document.payer_name1).to eq(payer_name1)
      expect(document.payer_name2).to eq(payer_name2)
      expect(document.payer_name3).to eq(payer_name3)
      expect(document.payer_name4).to eq(payer_name4)
      expect(document.payer_checking_number).to eq(payer_checking_number)
      expect(document.payer_bank_name).to eq(payer_bank_name)
      expect(document.payer_bank_city).to eq(payer_bank_city)
      expect(document.payer_bank_bic).to eq(payer_bank_bic)
      expect(document.payer_bank_checking_number).to eq(payer_bank_checking_number)
      expect(document.receiver_account_number).to eq(receiver_account_number)
      expect(document.receiver_date).to eq(receiver_date)
      expect(document.receiver_name).to eq(receiver_name)
      expect(document.receiver_inn).to eq(receiver_inn)
      expect(document.receiver_name1).to eq(receiver_name1)
      expect(document.receiver_name2).to eq(receiver_name2)
      expect(document.receiver_name3).to eq(receiver_name3)
      expect(document.receiver_name4).to eq(receiver_name4)
      expect(document.receiver_checking_number).to eq(receiver_checking_number)
      expect(document.receiver_bank_name).to eq(receiver_bank_name)
      expect(document.receiver_bank_city).to eq(receiver_bank_city)
      expect(document.receiver_bank_bic).to eq(receiver_bank_bic)
      expect(document.receiver_bank_checking_number).to eq(receiver_bank_checking_number)
      expect(document.payment_type).to eq(payment_type)
      expect(document.payment_purpose_code).to eq(payment_purpose_code)
      expect(document.payment_operation_type).to eq(payment_operation_type)
      expect(document.payment_code).to eq(payment_code)
      expect(document.payment_purpose).to eq(payment_purpose)
      expect(document.payment_purpose1).to eq(payment_purpose1)
      expect(document.payment_purpose2).to eq(payment_purpose2)
      expect(document.payment_purpose3).to eq(payment_purpose3)
      expect(document.payment_purpose4).to eq(payment_purpose4)
      expect(document.payment_purpose5).to eq(payment_purpose5)
      expect(document.payment_purpose6).to eq(payment_purpose6)
      expect(document.creator_status).to eq(creator_status)
      expect(document.payer_kpp).to eq(payer_kpp)
      expect(document.receiver_kpp).to eq(receiver_kpp)
      expect(document.kbk_index).to eq(kbk_index)
      expect(document.okato).to eq(okato)
      expect(document.basis_index).to eq(basis_index)
      expect(document.period_index).to eq(period_index)
      expect(document.number_index).to eq(number_index)
      expect(document.date_index).to eq(date_index)
      expect(document.type_index).to eq(type_index)
      expect(document.priority).to eq(priority)
      expect(document.accept_length).to eq(accept_length)
      expect(document.letter_of_credit_type).to eq(letter_of_credit_type)
      expect(document.payment_until).to eq(payment_until)
      expect(document.payment_terms1).to eq(payment_terms1)
      expect(document.payment_terms2).to eq(payment_terms2)
      expect(document.payment_terms3).to eq(payment_terms3)
      expect(document.payment_by_submission).to eq(payment_by_submission)
      expect(document.extra_terms).to eq(extra_terms)
      expect(document.supplier_account_number).to eq(supplier_account_number)
      expect(document.documents_send_date).to eq(documents_send_date)
    end

    it "should correctly build when optional attributes are nil" do
      document = ClientBankExchange2::Models::Document.new(
        type: type,
        number: number,
        date: date,
        sum: sum,
        receipt_date: nil,
        receipt_time: nil,
        receipt_content: nil,
        payer_account_number: nil,
        payer_date: nil,
        payer_name: nil,
        payer_inn: nil,
        payer_name1: nil,
        payer_name2: nil,
        payer_name3: nil,
        payer_name4: nil,
        payer_checking_number: nil,
        payer_bank_name: nil,
        payer_bank_city: nil,
        payer_bank_bic: nil,
        payer_bank_checking_number: nil,
        receiver_account_number: nil,
        receiver_date: nil,
        receiver_name: nil,
        receiver_inn: nil,
        receiver_name1: nil,
        receiver_name2: nil,
        receiver_name3: nil,
        receiver_name4: nil,
        receiver_checking_number: nil,
        receiver_bank_name: nil,
        receiver_bank_city: nil,
        receiver_bank_bic: nil,
        receiver_bank_checking_number: nil,
        payment_type: nil,
        payment_purpose_code: nil,
        payment_operation_type: nil,
        payment_code: nil,
        payment_purpose: nil,
        payment_purpose1: nil,
        payment_purpose2: nil,
        payment_purpose3: nil,
        payment_purpose4: nil,
        payment_purpose5: nil,
        payment_purpose6: nil,
        creator_status: nil,
        payer_kpp: nil,
        receiver_kpp: nil,
        kbk_index: nil,
        okato: nil,
        basis_index: nil,
        period_index: nil,
        number_index: nil,
        date_index: nil,
        type_index: nil,
        priority: nil,
        accept_length: nil,
        letter_of_credit_type: nil,
        payment_until: nil,
        payment_terms1: nil,
        payment_terms2: nil,
        payment_terms3: nil,
        payment_by_submission: nil,
        extra_terms: nil,
        supplier_account_number: nil,
        documents_send_date: nil
      )

      expect(document.receipt_date).to be_nil
      expect(document.receipt_time).to be_nil
      expect(document.receipt_content).to be_nil
      expect(document.payer_account_number).to be_nil
      expect(document.payer_date).to be_nil
      expect(document.payer_name).to be_nil
      expect(document.payer_inn).to be_nil
      expect(document.payer_name1).to be_nil
      expect(document.payer_name2).to be_nil
      expect(document.payer_name3).to be_nil
      expect(document.payer_name4).to be_nil
      expect(document.payer_checking_number).to be_nil
      expect(document.payer_bank_name).to be_nil
      expect(document.payer_bank_city).to be_nil
      expect(document.payer_bank_bic).to be_nil
      expect(document.payer_bank_checking_number).to be_nil
      expect(document.receiver_account_number).to be_nil
      expect(document.receiver_date).to be_nil
      expect(document.receiver_name).to be_nil
      expect(document.receiver_inn).to be_nil
      expect(document.receiver_name1).to be_nil
      expect(document.receiver_name2).to be_nil
      expect(document.receiver_name3).to be_nil
      expect(document.receiver_name4).to be_nil
      expect(document.receiver_checking_number).to be_nil
      expect(document.receiver_bank_name).to be_nil
      expect(document.receiver_bank_city).to be_nil
      expect(document.receiver_bank_bic).to be_nil
      expect(document.receiver_bank_checking_number).to be_nil
      expect(document.payment_type).to be_nil
      expect(document.payment_purpose_code).to be_nil
      expect(document.payment_operation_type).to be_nil
      expect(document.payment_code).to be_nil
      expect(document.payment_purpose).to be_nil
      expect(document.payment_purpose1).to be_nil
      expect(document.payment_purpose2).to be_nil
      expect(document.payment_purpose3).to be_nil
      expect(document.payment_purpose4).to be_nil
      expect(document.payment_purpose5).to be_nil
      expect(document.payment_purpose6).to be_nil
      expect(document.creator_status).to be_nil
      expect(document.payer_kpp).to be_nil
      expect(document.receiver_kpp).to be_nil
      expect(document.kbk_index).to be_nil
      expect(document.okato).to be_nil
      expect(document.basis_index).to be_nil
      expect(document.period_index).to be_nil
      expect(document.number_index).to be_nil
      expect(document.date_index).to be_nil
      expect(document.type_index).to be_nil
      expect(document.priority).to be_nil
      expect(document.accept_length).to be_nil
      expect(document.letter_of_credit_type).to be_nil
      expect(document.payment_until).to be_nil
      expect(document.payment_terms1).to be_nil
      expect(document.payment_terms2).to be_nil
      expect(document.payment_terms3).to be_nil
      expect(document.payment_by_submission).to be_nil
      expect(document.extra_terms).to be_nil
      expect(document.supplier_account_number).to be_nil
      expect(document.documents_send_date).to be_nil
    end

    it "should correctly build when optional attributes are ommited" do
      document = ClientBankExchange2::Models::Document.new(
        type: type,
        number: number,
        date: date,
        sum: sum
      )

      expect(document.receipt_date).to be_nil
      expect(document.receipt_time).to be_nil
      expect(document.receipt_content).to be_nil
      expect(document.payer_account_number).to be_nil
      expect(document.payer_date).to be_nil
      expect(document.payer_name).to be_nil
      expect(document.payer_inn).to be_nil
      expect(document.payer_name1).to be_nil
      expect(document.payer_name2).to be_nil
      expect(document.payer_name3).to be_nil
      expect(document.payer_name4).to be_nil
      expect(document.payer_checking_number).to be_nil
      expect(document.payer_bank_name).to be_nil
      expect(document.payer_bank_city).to be_nil
      expect(document.payer_bank_bic).to be_nil
      expect(document.payer_bank_checking_number).to be_nil
      expect(document.receiver_account_number).to be_nil
      expect(document.receiver_date).to be_nil
      expect(document.receiver_name).to be_nil
      expect(document.receiver_inn).to be_nil
      expect(document.receiver_name1).to be_nil
      expect(document.receiver_name2).to be_nil
      expect(document.receiver_name3).to be_nil
      expect(document.receiver_name4).to be_nil
      expect(document.receiver_checking_number).to be_nil
      expect(document.receiver_bank_name).to be_nil
      expect(document.receiver_bank_city).to be_nil
      expect(document.receiver_bank_bic).to be_nil
      expect(document.receiver_bank_checking_number).to be_nil
      expect(document.payment_type).to be_nil
      expect(document.payment_purpose_code).to be_nil
      expect(document.payment_operation_type).to be_nil
      expect(document.payment_code).to be_nil
      expect(document.payment_purpose).to be_nil
      expect(document.payment_purpose1).to be_nil
      expect(document.payment_purpose2).to be_nil
      expect(document.payment_purpose3).to be_nil
      expect(document.payment_purpose4).to be_nil
      expect(document.payment_purpose5).to be_nil
      expect(document.payment_purpose6).to be_nil
      expect(document.creator_status).to be_nil
      expect(document.payer_kpp).to be_nil
      expect(document.receiver_kpp).to be_nil
      expect(document.kbk_index).to be_nil
      expect(document.okato).to be_nil
      expect(document.basis_index).to be_nil
      expect(document.period_index).to be_nil
      expect(document.number_index).to be_nil
      expect(document.date_index).to be_nil
      expect(document.type_index).to be_nil
      expect(document.priority).to be_nil
      expect(document.accept_length).to be_nil
      expect(document.letter_of_credit_type).to be_nil
      expect(document.payment_until).to be_nil
      expect(document.payment_terms1).to be_nil
      expect(document.payment_terms2).to be_nil
      expect(document.payment_terms3).to be_nil
      expect(document.payment_by_submission).to be_nil
      expect(document.extra_terms).to be_nil
      expect(document.supplier_account_number).to be_nil
      expect(document.documents_send_date).to be_nil
    end
  end
end
