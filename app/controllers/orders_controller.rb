class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  respond_to :json

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def new
    @orders = Order.new
  end

  def create
    @order = Order.create(order_params)

    if @order.errors.nil? == false
      head :http_version_not_supported
      return
    end

    if @order.save
      flash[:success] = "Created successfully"
      head :ok
    end
  end

  def show
    @order = Order.find(params[:id])
    respond_with(@order)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:hire_id, :item_id, :request, :booked)
  end
end