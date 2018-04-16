<<<<<<< HEAD
# == Schema Information
#
# Table name: groups
#
#  id      :integer          not null, primary key
#  name    :string(255)
#  address :text(65535)
#


class Group < ApplicationRecord
  has_many :users
  has_many :hires
  validates :name, presence: true, uniqueness: true
end
=======
# == Schema Information
#
# Table name: groups
#
#  id      :integer          not null, primary key
#  name    :string(255)
#  address :text(65535)
#


class Group < ApplicationRecord
  has_many :users
  has_many :hires

  def as_json(options=nil)
    super(include: { hires: { include: { orders: { include: { item: { include: :size } } } } } })
  end
end
>>>>>>> cors-fix
