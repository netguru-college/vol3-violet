class Ability
  include CanCan::Ability

  # references:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities:-Best-Practices
  def initialize(user)
    return if user.blank?
    # creator can manage his groups
    can :destroy, Group, creator_id: user.id
    return unless user.admin?
    can :ban, User
    can :destroy, User
  end
end
