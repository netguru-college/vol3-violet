class BillsController < ApplicationController
  def new
    @bill = Bill.new
  end

  def create
    @bill = Bills::CreateService.new(bill_params, current_user.id).call
    if @bill.persisted?
      # flash[:success] = 'Bill created.'
      # redirect_to group_bill_path(params[:group_id], @bill)
      redirect_to group_path(params[:group_id]), notice: 'Bill created'
    else
      flash.now[:alert] = 'Something went wrong.  Please check the form.'
      render :news
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to user_path(current_user), notice: 'Bill was successfully deleted'
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])
    @bill.update(bill_params[:bill])
    redirect_to user_path(current_user)
  end

  private

  def bill_params
    params.permit(:group_id, bill: %i[id payer_id amount split_type title])
  end
end
