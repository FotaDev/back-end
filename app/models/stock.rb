class Stock < ApplicationRecord
  belongs_to :item
  belongs_to :size, :foreign_key => 'size', :class_name  => 'Size', :primary_key => 'size'
end