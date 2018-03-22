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

  has_many :item_packs
  has_many :packs, through: :item_packs

  validates :description, presence: true

  def as_json(options=nil)
    super(include: [:size, :packs, :stocks])
  end
end
