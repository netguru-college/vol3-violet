class Ability
  include CanCan::Ability

  def initialize(user)
    can :ban, User if user.admin? && user.present?
    can :destroy, User if user.admin? && user.present?
  end
end
