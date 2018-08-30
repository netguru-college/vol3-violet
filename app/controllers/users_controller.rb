class UsersController < ApplicationController
  def index
    @all_users = User.all.paginate(page: params[:page], per_page: 5)
  end

  def create; end

  def edit; end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if can?(:destroy, User) && !@user.admin?
      @user.destroy
      redirect_to root_path, notice: 'User was successfully destroyed!'
    else
      redirect_to root_path, alert: 'You can\'t perform this action!'
    end
  end

  # WTFFFF ?!
  def ban
    if can? :ban, User
      value = BanUser.new(params[:id]).call
      flash[:alert] = 'Could not perform this action' unless value
      flash[:notice] = 'Done!' if value
    else
      flash[:alert] = 'You are not permitted to perform this action!'
    end
    redirect_to root_path
  end

  def settle_debt
    # return unless can?(:update, @bill) - coś jest nie tak
    debt = Debt.find(params[:debt_id])
    debt.update(paid: true)
    redirect_to user_path(current_user) #:show, id: current_user.id#user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:blocked)
  end
end
