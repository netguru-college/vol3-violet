class Ability
  include CanCan::Ability

  def initialize(user)
    @current_user = user
    can :ban, User if admin_privilege
    can :destroy, User if admin_privilege
  end

  private

  def admin_privilege
    @current_user.admin? && @current_user.present?
  end
end
