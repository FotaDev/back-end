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
  before_save :checkMakeModelMatch

  belongs_to :item

  validates :make, :model, :barcode, presence: true

  def as_json(options=nil)
    super({ include: { item: { include: :size } } })
  end

  def checkMakeModelMatch
  # TODO make sure that all stocks with the same item_id have the same value for 'model' and 'make'
  end

end
