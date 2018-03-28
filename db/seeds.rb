# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do 
  Group.create(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
  ) 
end
User.create(
  username: Faker::Dog.name,
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  group_id: 1
)
User.create(
  username: Faker::Dog.name,
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  group_id: 2
)

# Past Hire

Hire.create(
  user_id: 1,
  group_id: 1,
  collect_date: Date.yesterday - 2.months,
  return_date: Date.today - 1.month,
  status: 2,
  band: 3,
  reference: 'Another text of this Hire',
  invoice_number: 15
)

Hire.create(
  user_id: 1,
  group_id: 1,
  collect_date: 2.weeks.ago - 1.month,
  return_date: 1.week.ago - 1.month,
  status: 2,
  band: 3,
  reference: 'Another text of this Hire',
  invoice_number: 15
)

