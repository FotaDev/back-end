# == Schema Information
#
# Table name: ordered_sizes
#
#  id      :integer          not null, primary key
#  hire_id :integer
#  request :integer
#  booked  :integer
#

class OrderedSize < ApplicationRecord
  belongs_to :hire
  belongs_to :item
end
