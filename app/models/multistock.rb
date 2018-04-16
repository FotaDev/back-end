# == Schema Information
#
# Table name: multistocks
#
#  id              :integer          not null, primary key
#  stock_id        :integer
#  actual_quantity :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Multistock < ApplicationRecord
  belongs_to :stock

  validates :actual_quantity, presence: true

  def as_json(options = nil)
    super(include: {stock: {include: {item: {include: :size}}}})
  end
end
