class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    can :ban, User if admin_privilege
    can :destroy, User if admin_privilege
  end

  private

  def admin_privilege
    current_user.admin? && current_user.present? && !user.admin?
  end
end
