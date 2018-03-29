# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.create(
  name: 'Group 1',
  address: 'Fake Street 1'
)
Group.create(
  name: 'Group 2',
  address: 'Calle Falsa 2'
)
Group.create(
  name: 'Group 3',
  address: 'Bacon Street 22'
)

User.create(
  username: 'Admin 1',
  email: 'car@los.com',
  password: '111111',
  group_id: 1
)
User.create(
  username: 'Admin 2',
  email: 'user2@test.com',
  password: '111111',
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
# Present

Hire.create(
  user_id: 2,
  group_id: 2,
  collect_date: Date.today - 1.day,
  return_date: Date.today + 1.week,
  status: 1,
  band: 1,
  reference: 'Lorem Ipsum dolor sit amet',
  invoice_number: 191_212
)

Hire.create(
  user_id: 2,
  group_id: 2,
  collect_date: Date.today - 1.day,
  return_date: Date.today + 1.week,
  status: 0,
  band: 1,
  reference: 'This one has not been collected yet',
  invoice_number: 191_212
)
# Future

Hire.create(
  user_id: 1,
  group_id: 1,
  collect_date: Date.tomorrow + 1.week,
  return_date: Date.tomorrow + 2.weeks,
  status: 3,
  band: 6,
  reference: 'More text that I have to write',
  invoice_number: 15
)

Hire.create(
  user_id: 1,
  group_id: 1,
  collect_date: Date.tomorrow + 1.week,
  return_date: Date.tomorrow + 2.weeks,
  status: 3,
  band: 6,
  reference: 'More text that I have to write',
  invoice_number: 15
)

Size.create(
  details: 'small'
)

Size.create(
  details: 'large'
)

Size.create(
  details: '38'
)

Size.create(
  details: 'N/A'
)

Item.create(
  description: 'jacket',
  size: Size.first
)

Item.create(
  description: 'jacket',
  size: Size.second
)

Item.create(
  description: 'trousers',
  size: Size.first
)

Item.create(
  description: 'gloves',
  size: Size.first
)

Item.create(
  description: 'boot',
  size: Size.third
)

Item.create(
  description: 'battery',
  size: Size.fourth
)

Item.create(
  description: '1-person Tent Poles',
  size: Size.fourth
)

Item.create(
  description: '3-person Tent Poles',
  size: Size.fourth
)

Item.create(
  description: '14 Tent Pegs',
  size: Size.fourth
)

Item.create(
  description: '1-person Tent (sheets)',
  size: Size.fourth
)

Item.create(
  description: '3-person Tent (sheets)',
  size: Size.fourth
)

Stock.create(
  item_id: 1,
  barcode: 12345,
  make: 'Adidaz',
  model: 'Adidaz Cipkaz'
)

Stock.create(
  item_id: 1,
  barcode: 123456,
  make: 'Adidaz',
  model: 'Adidaz Cipkaz'
)

Stock.create(
  item_id: 3,
  barcode: 39837,
  make: 'Pumba',
  model: 'Pr0 xP'
)

Stock.create(
  item_id: 2,
  barcode: 000223,
  make: 'Umboro',
  model: 'Umboro Samba'
)

Stock.create(
  item_id: 2,
  barcode: 0002233,
  make: 'Umboro',
  model: 'Umboro Samba'
)

Stock.create(
  item_id: 6,
  barcode: 2134123,
  make: 'Philips',
  model: 'Long Life Battery'
)

Multistock.create(
    stock_id: 6,
    actual_quantity: 150
)

Order.create(
  hire_id: 1,
  item_id: 1,
  request: 1
)

Order.create(
  hire_id: 1,
  item_id: 2,
  request: 1
)

Order.create(
  hire_id: 2,
  item_id: 1,
  request: 1
)

Order.create(
  hire_id: 2,
  item_id: 2,
  request: 1
)

Order.create(
  hire_id: 2,
  item_id: 6,
  request: 5
)

Pack.create(
  name: "TP1"
)

Pack.create(
  name: "TP3"
)

ItemPack.create(
  pack: Pack.find_by(name: "TP1"),
  item: Item.find_by(description: "1-person Tent Poles"),
  item_quantity: 1
)

ItemPack.create(
  pack: Pack.find_by(name: "TP1"),
  item: Item.find_by(description: "1-person Tent (sheets)"),
  item_quantity: 1
)

ItemPack.create(
  pack: Pack.find_by(name: "TP1"),
  item: Item.find_by(description: "14 Tent Pegs"),
  item_quantity: 1
)

ItemPack.create(
  pack: Pack.find_by(name: "TP3"),
  item: Item.find_by(description: "3-person Tent Poles"),
  item_quantity: 1
)

ItemPack.create(
  pack: Pack.find_by(name: "TP3"),
  item: Item.find_by(description: "3-person Tent (sheets)"),
  item_quantity: 1
)

ItemPack.create(
  pack: Pack.find_by(name: "TP3"),
  item: Item.find_by(description: "14 Tent Pegs"),
  item_quantity: 1
)

Loan.create(
  hire: Hire.first,
  stock: Stock.first
)