FactoryBot.define do

  factory :group do
    name Faker::Name.name
    address Faker::Address.full_address

  end

  factory :user do

    username  Faker::Dog.name
    email     Faker::Internet.email
    password  Faker::Internet.password
    group_id  1

  end

end
