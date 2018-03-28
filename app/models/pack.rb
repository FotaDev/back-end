class Pack < ApplicationRecord
  has_many :item_packs
  has_many :items, through: :item_packs

  validates :name, presence: true

  def as_json(options=nil)
    super(include: :items)
  end
end
