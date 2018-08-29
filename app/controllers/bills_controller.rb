class BillsController < ApplicationController
  def new
    @bill = Bill.new
  end

  def create
    @bill = Bills::CreateService.new(bill_params, current_user.id).call
    if @bill.persisted?
      flash[:success] = 'Bill created.'
      redirect_to group_bill_path(params[:group_id], @bill)
    else
      flash.now[:alert] = 'Something went wrong.  Please check the form.'
      render :new
    end
  end

  def show; end

  private

  def bill_params
    params.permit(:group_id, bill: %i[payer_id amount split_type])
  end
end
