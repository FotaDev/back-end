require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a group_id, role, username, name, email & password" do

    g = create(:group)
    user1 = create(:user, group_id: g.id)
    expect(user1).to be_valid

  end

  it "is invalid incorrect values" do

    u = User.create
    u.update(username: "ojete")
    expect(u).to be_invalid

  end

  it "is invalid with a duplicate email address" do

    group = create(:group)
    u1 = create(:user, email: 'john@example.com', group_id: group.id)
    u2 = User.new(email: u1.email)
    u2.valid?
    expect(u2.errors[:email]).to include("has already been taken")

  end

end
