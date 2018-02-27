class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
   # binding.pry
   # params.require(:user).permit(:user, :name, :nickname, :email, :password, :password_confirmation, :group_id, :uid, :username, :surname, :telephone, :role)
    User.create(email: params[:email], password: params[:password], group_id: params[:group_id])
  end

  def account_update_params
    #params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :group_id, :uid, :username, :surname, :telephone, :role)
    User.update(email: params[:email], password: params[:password], group_id: params[:group_id])
  end
end

