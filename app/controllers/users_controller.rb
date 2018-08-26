class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def create; end

  def edit; end

  def show; end

  def destroy; end

  def ban
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url
    else
      redirect_to users_url, notice: 'Could not perform operation'
    end
  end

  private

  def user_params
    params.require(:user).permit(:blocked)
  end
end
