class ItemPacksController < ApplicationController
  before_action :set_itempack, only: [:show]
  respond_to :json

  def index
    @itempacks = ItemPack.all
    respond_with(@itempacks)
  end

  def new
    @itempacks = ItemPack.new
  end

  def create
    @itempack = ItemPack.create(itempack_params)

    if @itempack.save
      flash[:success] = "Created successfully"
      head :ok
    end
  end

  def show
    @itempack = ItemPack.find(params[:id])
    respond_with(@itempack)
  end

  def set_itempack
    @itempack = ItemPack.find(params[:id])
  end

  private

  def itempack_params
    params.require(:item_pack).permit(:pack_id, :item_id, :item_quantity)
  end
end

