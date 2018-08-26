eeclass Ability
  include CanCan::Ability

  def initialize(user)
    # abilities for all users
    if user.present?
      # abilities for non-admin
      if user.admin?
        # abilities for admins
        can :index, User
      end
    end
  end
end
