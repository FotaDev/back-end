# == Schema Information
#
# Table name: loans
#
#  id         :integer          not null, primary key
#  hire_id    :integer
#  name_tag   :string(255)
#  date_out   :datetime
#  date_back  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Loan < ApplicationRecord
  belongs_to :hire
  belongs_to :stock

  def as_json(options=nil)
    super(include: { hire: { include: [:user, :group] }, stock: { include: { item: { include: :size } } } } )
  end
end
