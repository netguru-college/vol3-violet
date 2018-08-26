require 'faker'

User.find_or_create_by(email: 'user@aa.pl') do |user|
    user.username = 'user'
    user.password = "123456"
end

User.find_or_create_by(email: 'admin@aa.pl') do |user|
    user.username = 'admin'
    user.admin = true
    user.password = 'admin123'
end

5.times do
    User.find_or_create_by(email: "#{Faker::Hacker.adjective}@aa.pl") do |user|
        user.username = Faker::Hacker.adjective
        user.password = '123456'
    end
end