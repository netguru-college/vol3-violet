class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    can :ban, User if admin?
    can :destroy, User if admin?
  end

  private

  def admin?
    current_user.admin? && current_user.present? && !user.admin?
  end
end
