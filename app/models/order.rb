# == Schema Information
#
# Table name: orders
#
#  id      :integer          not null, primary key
#  hire_id :integer
#  request :integer
#  booked  :integer
#

class Order < ApplicationRecord
  belongs_to :hire
  belongs_to :item
  has_one :size

  validates :size_id, presence: true
end
