class Multistock < ApplicationRecord
  belongs_to :stock

  validates :actual_quantity, presence: true
end