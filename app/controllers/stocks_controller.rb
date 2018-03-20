class StocksController < ApplicationController
  before_action :set_stock, only: [:show]
  respond_to :json

  def index
    @stocks = Stock.all
    respond_with(@stocks)
  end

  def new
    @stocks = Stock.new
  end

  def create
    @stock = Stock.create(stock_params)

    if @stock.save
      flash[:success] = "Created successfully"
      head :ok
    end
  end

  def show
    @stock = Stock.find(params[:id])
    respond_with(@stock)
  end

  def set_stock
    @stock = Order.find(params[:id])
  end

  private

  def stock_params
    params.require(:stock).permit(:item_id, :barcode, :make, :model, :condition, :comments)
  end
end
