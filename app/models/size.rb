class Size < ApplicationRecord
  has_many :items

  validates :details, presence: true
end
