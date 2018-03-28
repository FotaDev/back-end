require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a group_id, role, username, name, email & password" do
    binding.pry
    user = User.new(
      role: ,
      username: ,
      name: ,
      email: ,
      password: ,
      group_id: 1
    )
  end
  it "is invalid incorrect values"do
  end
end
