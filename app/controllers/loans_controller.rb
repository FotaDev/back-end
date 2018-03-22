class LoansController < ApplicationController
  before_action :set_loan, only: [:show]
  respond_to :json

  def index
    @loans = Loan.all
    respond_with(@loans)
  end

  def new
    @loans = Loan.new
  end

  def create
    @loan = Loan.create(loan_params)

    if @loan.save
      flash[:success] = "Created successfully"
      head :ok
    end
  end

  def show
    @loan = Loan.find(params[:id])
    respond_with(@loan)
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end

  private

  def loan_params
    params.require(:loan).permit(:hire_id, :stock_id, :name_tag, :date_out, :date_back)
  end
end

