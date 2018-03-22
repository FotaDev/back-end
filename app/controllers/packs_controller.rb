class PacksController < ApplicationController
  before_action :set_pack, only: [:show]
  respond_to :json

  def index
    @packs = Pack.all
    respond_with(@packs)
  end

  def new
    @packs = Pack.new
  end

  def create
    @pack = Pack.create(pack_params)

    if @pack.save
      flash[:success] = "Created successfully"
      head :ok
    end
  end

  def show
    @pack = Pack.find(params[:id])
    respond_with(@pack)
  end

  def set_pack
    @pack = Pack.find(params[:id])
  end

  private

  def pack_params
    params.require(:pack).permit(:name)
  end
end
