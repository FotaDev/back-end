class Size < ApplicationRecord
  has_many :items, foreign_key: :size, primary_key: :size
  has_many :stocks, through: :item, foreign_key: :size, primary_key: :size

  validates :size, presence: true
end