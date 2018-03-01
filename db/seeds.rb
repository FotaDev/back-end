# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(
  username: "Admin 1",
  email: "car@los.com",
  password: "111111",
  group_id: 1
)
User.create(
  username: "Admin 2",
  email: "user2@test.com",
  password: "111111",
  group_id: 2
)


