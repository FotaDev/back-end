# == Schema Information
#
# Table name: multistocks
#
#  id              :integer          not null, primary key
#  stock_id        :integer
#  actual_quantity :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class MultistockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
