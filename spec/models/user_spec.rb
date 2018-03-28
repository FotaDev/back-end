require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a group_id, role, username, name, email & password" do
    create(:group)
    user1 = create(:user)
    binding.pry
  end
  it "is invalid incorrect values"
end
