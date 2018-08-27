class HomeController < ApplicationController
  def index
    @user = current_user
    @all_users = User.all.paginate(page: params[:page], per_page: 5)
  end
end
