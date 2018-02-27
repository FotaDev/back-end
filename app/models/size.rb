# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  style_id   :integer          not null
#  size       :integer          not null
#

class Size < ApplicationRecord
  belongs_to :ordered_item
end