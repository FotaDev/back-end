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
  before_save :check_availability

  validates :request, presence: true

  def check_availability
    @item = self.item_id
    @requested_amount = self.request
    @collection_date = self.hire.collect_date
    @return_date = self.hire.return_date

    # Count how many of this item we have
    @stock_quantity = Stock.where(item_id: @item).count

    if @stock_quantity >= @requested_amount
      # Find all overlapping hires and associated orders
      # where return date is between @collection_date and @return_date of this hire
      # where orders were placed on the same item
      @overlapping_hires = Order.joins(:hire)
                               .where(item_id: @item)
                               .where(hires: { return_date: @collection_date..@return_date })

      puts(@overlapping_hires)

      total_booked = 0

      @overlapping_hires.each do |order|
        puts("order.request: ")
        puts(order.request)
        total_booked += order.request
      end

      puts("total_booked: ")
      puts(total_booked)

      @stock_quantity -= total_booked
      puts("stock_quantity: ")
      puts(@stock_quantity)

      if @stock_quantity < 0
        errors.add(:base, "not enough in stock")
        throw :abort
      end
    else
      errors.add(:base, "not enough in stock")
      throw :abort
    end
  end

  def as_json(options=nil)
    # super({ include: { item: { include: :size } } })
    super(include: { hire: { include: [:user, :group] }, item: { include: :size } } )
  end
end
