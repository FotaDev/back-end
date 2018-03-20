class MultistocksController < ApplicationController
  before_action :set_multistock, only: [:show]
  respond_to :json

  def index
    @multistocks = Multistock.all
    respond_with(@multistocks)
  end

  def new
    @multistocks = Multistock.new
  end

  def create
    @multistock = Multistock.create(multistock_params)

    if @multistock.save
      flash[:success] = "Created successfully"
      head :ok
    end
  end

  def show
    @multistock = Multistock.find(params[:id])
    respond_with(@multistock)
  end

  def set_multistock
    @multistock = Order.find(params[:id])
  end

  private

  def multistock_params
    params.require(:multistock).permit(:item_id, :barcode, :make, :model, :condition, :comments)
  end
end
