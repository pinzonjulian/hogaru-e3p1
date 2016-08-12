# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'julianpinzoneslava@gmail.com',
                   password: 'password',
                   password_confirmation: 'password')

100.times do |n|
  name = Faker::Name.name
  date = Faker::Date.between(30.days.ago, Date.today)
  calories = rand(300..1500)
  burnt = [true, false].sample

  Activity.create!(name: name,
                  date: date,
                  calories: calories,
                  burnt: burnt,
                  user_id: user.id)

end
