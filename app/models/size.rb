class Size < ApplicationRecord
  has_many :items
  has_many :stocks, through: :item

  validates :details, presence: true
end