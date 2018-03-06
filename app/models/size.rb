# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  size       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Size < ApplicationRecord
end
