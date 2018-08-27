class UsersController < ApplicationController
  def index
    @all_users = User.all.paginate(page: params[:page], per_page: 5)
  end

  def create; end

  def edit; end

  def show; end

  def destroy
  begin
    authorize! :destroy, current_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed!'
  rescue
    redirect_to root_path, alert: 'You can\'t perform this action!'
  end
  end

  def ban
    begin
      # manually authorize
      # futher references:
      # https://github.com/CanCanCommunity/cancancan/wiki/authorizing-controller-actions
      authorize! :ban, current_user
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to users_url
      else
        redirect_to users_url, notice: 'Could not perform operation'
      end
    rescue
      redirect_to root_path, alert: 'You can\'t perform this action!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:blocked)
  end
end
