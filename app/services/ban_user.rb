class BanUser
  def initialize(user_id)
    @user_id = user_id
  end

  def call
    @user = User.find_by(id: @user_id)
    return false if @user.nil?
    @user.update(blocked: true)
    true
  end
end
