# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  size_id    :integer
#  barcode    :string(255)
#  make       :string(255)
#  model      :string(255)
#  condition  :integer
#  comments   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ApplicationRecord
  belongs_to :item
  has_one :loan

  validates :make, :model, :barcode, presence: true

  def as_json(options=nil)
    super({ include: { item: { include: :size } } })
  end

end
