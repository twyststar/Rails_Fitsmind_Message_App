# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! do |u|
    u.email     = 'usertest1@test.com'
    u.password    = 'password'
    u.user_name = "Test User1"
end
User.create! do |u|
    u.email     = 'usertest2@test.com'
    u.password    = 'password'
    u.user_name = "Test User2"
end
User.create! do |u|
    u.email     = 'trainertest1@test.com'
    u.password    = 'password'
    u.trainer = true
    u.user_name = "Test Trainer1"
end
User.create! do |u|
    u.email     = 'trainertest2@test.com'
    u.password    = 'password'
    u.trainer = true
    u.user_name = "Test Trainer2"
end
User.create! do |u|
    u.email     = 'admintest@test.com'
    u.password    = 'password'
    u.admin = true
    u.trainer = true
    u.user_name = "Test Admin"
end
