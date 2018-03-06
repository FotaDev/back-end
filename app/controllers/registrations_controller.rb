class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.create(strong_params)
   
    
   # if @user.save
   #   binding.pry
   # end
  end

  private
  def strong_params
    params.permit(:email, :password, :group_id,:confirm_success_url, :registration)
  end

end

