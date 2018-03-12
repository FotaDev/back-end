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

class Item < ApplicationRecord
  has_many :orders
  belongs_to :size

  validates :description, presence: true
end