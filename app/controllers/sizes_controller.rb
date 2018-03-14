class SizesController < ApplicationController
  before_action :set_size, only: [:show]
  respond_to :json

  def index
    @sizes = Size.all
    respond_with(@sizes)
  end

  def new
    @size = Size.new
  end

  def create
    @size = Size.create(size_params)

    if @size.save
      flash[:success] = "Created successfully"
      head :ok
    end
  end

  def show
    @size = Size.find(params[:id])
    respond_with(@size)
  end

  def set_size
    @size = Size.find(params[:id])
  end

  private

  def size_params
    params.require(:size).permit(:details)
  end
end