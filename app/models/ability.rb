class Ability
  include CanCan::Ability

  def initialize(user)
    # abilities for all users
    # abilities for admins
    can :ban, User if user.admin? && use.present?
    can :destroy, User if user.admin? && user.present?
  end
end
