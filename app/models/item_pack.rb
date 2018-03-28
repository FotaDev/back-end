class ItemPack < ApplicationRecord
  belongs_to :pack
  belongs_to :item

  validates :item_quantity, presence: true

  def as_json(options=nil)
    super(include: [:pack, item: { include: :size }])
  end
end
