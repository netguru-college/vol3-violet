class Ability
  include CanCan::Ability

  def initialize(user)
    can :ban, User if current_user.admin? && current_user.present? && !user.admin?
    can :destroy, User if current_user.admin? && current_user.present? && !user.admin?
  end
end
