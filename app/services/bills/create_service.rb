module Bills
  class CreateService
    def initialize(params)
      @amount = params[:amount].to_f.round(2)
      @borrowers = params[:borrowers]
      @group_id = params[:group_id]
      @payer_id = params[:payer_id]
      @split_type = params.fetch(:split_type, "equal")
      @splitted_amount = (amount / (borrowers.count + 1))
    end

    def call
      if bill.save
        Bills::CreateDebtsService.new(bill: bill, borrowers: borrowers, amount: splitted_amount).call 
      else
        false
      end
    end

  private

    attr_reader :amount, :borrowers, :group_id, :payer_id, :split_type, :splitted_amount

    def bill
      @bill ||= Bill.new(
        amount: amount,
        borrowers: borrowers,
        group_id: group_id,
        payer_id: payer_id,
        split_type: split_type
      )
    end
  end
end