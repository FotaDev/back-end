# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  hire_id    :integer
#  request    :integer
#  booked     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#


class Order < ApplicationRecord
  belongs_to :hire
  belongs_to :item

  validates :request, presence: true

  def as_json(options=nil)
    # super({ include: { item: { include: :size } } })
    super(include: { hire: { include: [:user, :group] }, item: { include: :size } } )
  end
end
