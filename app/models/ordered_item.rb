# == Schema Information
#
# Table name: ordered_items
#
#  id      :integer          not null, primary key
#  hire_id :integer
#  request :integer
#  booked  :integer
#


class OrderedItem < ApplicationRecord
  belongs_to :hire
  has_one :style

=begin
  validates_associated :styles
  validates :name, presence: true;
=end
end
