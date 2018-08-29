class Ability
  include CanCan::Ability

  # references:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities:-Best-Practices
  def initialize(user)
    return if user.blank?
    # only group member can edit the group
    can :update, Group do |group|
      group.users.include? user
    end
    # only creator can delete his groups
    can :destroy, Group, creator_id: user.id
    return unless user.admin?
    can :ban, User
    can :destroy, User
  end
end