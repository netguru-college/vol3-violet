module Bills
  class CreateDebtsService
    def initialize(bill:, borrowers:, amount:)
      @bill = bill
      @borrowers = borrowers
      @amount = amount
    end

    def call
      create_debts
    end

    private

    attr_reader :bill, :borrowers, :amount

    def create_debts
      borrowers.each do |borrower|
        Debt.create!(
          bill_id: bill.id,
          amount: amount,
          borrower_id: borrower.id,
          paid: false
        )
      end
    end
  end
end
