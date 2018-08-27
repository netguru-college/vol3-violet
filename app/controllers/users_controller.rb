class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def create; end

  def edit; end

  def show; end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed!'
  rescue StandardError
    redirect_to root_path, alert: 'You can\'t perform this action!'
  end

  def ban
    @user = User.find(params[:id])
    authorize! :ban, @user
    unless BanUser.new(params[:id]).call
      redirect_to root_path, alert: 'Could\t update user!'
    end
      rescue StandardError
      redirect_to root_path, alert: 'You can\'t perform this action!'
  end


  private

  def user_params
    params.require(:user).permit(:blocked)
  end
end
