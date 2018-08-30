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
  User.create(email: "#{Faker::Hacker.unique.adjective}@aa.pl", username: Faker::Hacker.adjective, password: '123456')
end

6.times do
  user = User.where(email: 'user@aa.pl').first
  group = Group.create(name: Faker::University.name, creator_id: user.id)
  user.groups << group
end

300.times do
  random_user = User.offset(rand(User.count)).first
  bill = Bill.create(payer_id: random_user.id, amount: Random.new.rand(10..1000), split_type: 'equal', title: Faker::HarryPotter.spell)
  Group.offset(rand(Group.count)).first.bills << bill
end

