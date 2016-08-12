# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'julianpinzoneslava@gmail.com', password: 'password')

Activity.create!(name: 'First Workout',
                 date: Time.zone.now,
                 cal_burnt: 0,
                 cal_intake: 500)

100.times do |n|
  name = Faker::Name.name
  date = Faker::Date.between(5.days.ago, 5.days.from_now)
  cal_burnt = rand(300..1500)
  cal_intake = rand(300..1500)

  Activity.create(name: name,
                  date: date,
                  cal_burnt: cal_burnt,
                  cal_intake: cal_intake)

end
