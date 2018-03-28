class HiresController < ApplicationController
  before_action :set_hire, only: [:show, :update, :edit]
  #before_action :redirect_non_registered
  respond_to :json

  def index
    # Copy of current for the moment
    @Hires = Hire.all
    @Past_Hires = past_hires(@Hires)
    @Past_Hires ||= []

    @Current_Hires = current_hires(@Hires)
    @Future_Hires = future_hires(@Hires)
    respond_with(@Hires)
  end

  def new
    @Hire = Hire.new
  end

  def create
    @Hire = Hire.create(hire_params)

    if @Hire.save
      flash[:success] = "Created successfully"
      head :ok
    end

  end

  def show
    @Hire = Hire.find(params[:id])
    respond_with(@Hire)
  end

  def update
    if @Hire.update(hire_params)
      redirect_to @Hire
    else
      render 'index'
    end
  end

  def edit
  end

  def past_hires(hire)
    hire.returned_before(Date.today)
  end

  def current_hires(hire)
    #Collection day today or less AND returning day larger than today
    # current from before today and returned after (hardcoded) 1 year
    hires = hire.collected_before(Date.today)
    hires = hires.returned_after(Date.today)
  end

  def future_hires(hire)
    hires = hire.collected_after(Date.today)
    hires = hires.returned_after(2.years)
  end

  def set_hire
    @Hire = Hire.find(params[:id])
  end

  private

  def hire_params
    params.require(:hire).permit(:collect_date, :return_date, :status, :band, :reference, :invoice_number, :user_id, :group_id)
  end

end
