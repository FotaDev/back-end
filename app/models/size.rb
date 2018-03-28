# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  details    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Size < ApplicationRecord
  has_many :items

  validates :details, presence: true
end
