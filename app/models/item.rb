# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  size_id     :integer
#  description :string(255)
#  band_price  :float(24)
#  sale_price  :float(24)
#  saleable    :boolean
#  browseable  :boolean
#  has_stock   :boolean
#  category    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Item < ApplicationRecord
  has_many :orders
  has_many :stocks
  belongs_to :size

  validates :description, presence: true

  def as_json(options=nil)
    super(:include => [:size, :stocks])
  end
end
