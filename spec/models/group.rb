require 'rails_helper'

RSpec.describe Group, type: :model do

  it "is invalid without a name" do

    group = Group.new
    group.name = ''
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")

  end


  it "is invalid without an address" do

    group = Group.new
    group.address = ''
    group.valid?
    expect(group.errors[:address]).to include("can't be blank")

  end

  it "is valid with correct parameters" do
  end
end



#it 'should validate presence' do
#  record = User.new
#  record.email = '' # invalid state
#  record.valid? # run validations
#  record.errors[:email].should include("can't be blank") # check for presence of error
#
#  record.email = 'foo@bar.com' # valid state
#  record.valid? # run validations
#  record.errors[:email].should_not include("can't be blank") # check for absence of error
#end
