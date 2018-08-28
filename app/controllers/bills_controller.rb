class BillsController < ApplicationController
  def new
    @bill = Bill.new
  end

  def create
    if Bills::CreateService.new(bill_params).call
      flash[:success] = 'Bill created.'
      redirect_to user_path
    else
      flash.now[:alert] = 'Something went wrong.  Please check the form.'
      render :new
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:payer_id, :amount, :split_type, :group_id, borrowers: [])
  end
end
