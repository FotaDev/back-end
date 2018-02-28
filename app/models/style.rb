class Style < ApplicationRecord
  belongs_to :ordered_item
  has_one :size
end
