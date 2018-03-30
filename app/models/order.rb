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

    puts "--------------Order details--------------"
    puts "Item_id: #{@item}"
    puts "Request amount: #{@requested_amount}"
    puts "Collection date: #{@collection_date}"
    puts "Return date: #{@return_date}"
    puts "-----------------------------------------"

    # Multistock.joins(:stock).where(:stocks => {:item_id => 1})
    # Stock.includes(:multistock).where(item_id: 3)
    # Stock.includes(:multistock).where(item_id: 6).first.multistock
    # Stock.left_joins(:multistock).where(item_id: 1)
    # Multistock.joins(:stock).where(:stocks =>  {:item_id => 1}).exists?
    #
    # Stock.left_joins(:multistock).select('stocks.id, stocks.make, multistocks.actual_quantity as kurwa')
    # Stock.left_joins(:multistock).select('stocks.id', 'stocks.make', 'multistocks.actual_quantity')
    # Stock.left_joins(:multistock).select(:id, :make, :'multistocks.actual_quantity').references(:multistock)
    # Stock.select(:id, :make, :'multistocks.actual_quantity').left_joins(:multistock).last.actual_quantity
    #
    # Stock.select(:id, :make, :'multistocks.actual_quantity').left_joins(:multistock)
    # Stock.select(:id, :make, :'multistocks.actual_quantity').left_joins(:multistock).where(item_id: 1)
    # foo.each do |stock|
    # count = 0
    # if stock.multistock.nil?
    #   puts 'fart'
    # else
    #   count += stock.multistock.actual_quantity
    # end
    # puts count
    #
    # Loan.includes(:stock).where(stocks: { item_id: 1 })
    # Loan.includes(:stock, :hire).where(stocks: { item_id: 1 }, hire_id: 2)
    # THE TICKET IN PROGRESS
    # Loan.includes(:stock, :hire).where(stocks: { item_id: 1 }, hires: {})
    # Loan.includes(:stock, :hire).where(stocks: { item_id: 1 }, "hires.return_date" => Date.today-1.year..Date.today)

    # PART 1 - count how many of this item we have - first check if it is not a multistock
    if Multistock.left_joins(:stock).where(:stocks => {:item_id => @item}).exists?
      @stock_quantity = Stock.find_by(item_id: @item).multistock.actual_quantity
    else
      @stock_quantity = Stock.where(item_id: @item).count
    end

    puts "-------Stock quantity: #{@stock_quantity}-------"

    # PART 2 - conflicting loans
    sql = "SELECT COUNT(loans.id) as count FROM loans LEFT JOIN stocks ON stocks.id = loans.stock_id LEFT JOIN hires ON hires.id = loans.hire_id WHERE item_id LIKE #{@item} AND (return_date IS NULL OR return_date = '' OR return_date > #{@collection_date.strftime("%e-%m-%y %H:%M")} OR return_date < NOW())"
    puts Loan.find_by_sql(sql).first.count

    # PART 3.1 - find out if the size is in any packs
    Pack.includes(:item_packs).where('item_packs.item_id' => @item)
    Pack.includes(:item_packs).where(item_packs: { item_id: @item })



    if @stock_quantity >= @requested_amount
      # Find all orders that were placed on the same item
      # where return date is between collection_date and return_date of this hire
      @overlapping_hires = Order.joins(:hire)
                               .where(item_id: @item)
                               .where(hires: {return_date: @collection_date..@return_date})

      total_booked = 0

      @overlapping_hires.each do |order|
        total_booked += order.request
      end

      puts "------------Validation details-----------"
      puts "Total booked excluding this order: #{total_booked}"

      @stock_quantity -= total_booked
      puts "Stock quantity minus overlapping hires: #{@stock_quantity}"
      puts "Stock quantity minus requested amount: #{@stock_quantity - @requested_amount}"
      puts "-----------------------------------------"

      # if there is less stock than requested amount after subtracting amounts on overlapping hires
      if @stock_quantity < @requested_amount
        puts "----Not enough stock, order rejected----"
        errors.add(:base, "Not enough stock, order rejected")
        throw :abort
      else
        puts "----Sufficient stock, order accepted----"
      end
    else
      puts "----Not enough stock, order rejected----"
      errors.add(:base, "Not enough stock, order rejected")
      throw :abort
    end
  end

  def as_json(options = nil)
    # super({ include: { item: { include: :size } } })
    super(include: {hire: {include: [:user, :group]}, item: {include: :size}})
  end

end
