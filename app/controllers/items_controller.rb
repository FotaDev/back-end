class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  respond_to :json

  def index
    @items = Item.all
    respond_with(@items)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      flash[:success] = "Created successfully"
      head :ok
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:description, :size_id, :band_price, :sale_price, :saleable, :browseable, :has_stock, :category)
  end
end