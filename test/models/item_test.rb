# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  description      :string(255)
#  ordered_sizes_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  size_id          :integer
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
