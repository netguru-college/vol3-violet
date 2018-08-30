class BillsController < ApplicationController
  before_action :set_bill, only: %i[destroy edit update]

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bills::CreateService.new(bill_params, current_user.id).call
    if @bill.persisted?
      redirect_to group_path(params[:group_id]), notice: 'Bill created.'
    else
      flash.now[:alert] = 'Something went wrong.  Please check the form.'
      render :news
    end
  end

  def destroy
    if can?(:destroy, @bill)
      @bill.destroy
      redirect_to user_path(current_user), notice: 'Bill was successfully deleted'
    else
      redirect_to user_path(current_user), alert: 'Can\'t perform this operation!'
    end
  end

  def edit
    redirect_to user_path(current_user), alert: 'Can\'t perform this operation!' unless can?(:edit, @bill)
  end

  def update
    if can?(:update, @bill)
      @bill.destroy
      @bill = Bills::CreateService.new(bill_params, current_user.id).call
      if @bill.persisted?
        redirect_to group_path(params[:group_id]), notice: 'Bill updated.'
      else
        flash.now[:alert] = 'Something went wrong.  Please check the form.'
        render :news
      end
    else
      redirect_to user_path(current_user), alert: 'Can\'t perform this operation!'
    end
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.permit(:group_id, bill: %i[id payer_id amount split_type title])
  end
end
