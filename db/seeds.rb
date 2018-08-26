require 'faker'

User.find_or_create_by(email: 'user2@bollywood.com') do |user|
    user.password = "123456"
end