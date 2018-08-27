class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :check_blocked

  protected

  def configure_permited_parameters
    added_attrs = %i[username email password password_confirmation avatar avatar_cache remove_avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def check_blocked
    return if current_user.blank? || !current_user.blocked?
    sign_out current_user
    redirect_to new_user_session_path, alert: 'Account suspended'
  end
end
