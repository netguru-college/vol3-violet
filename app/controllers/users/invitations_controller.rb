class Users::InvitationsController < Devise::InvitationsController

  private

  # called when creating invitation
  def invite_resource
    super do |u|
      u.skip_invitation = true
    end
  end

  # called when accepting invitation
  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    Analytics.report('invite.accept', resource.id)
    resource
  end

end
