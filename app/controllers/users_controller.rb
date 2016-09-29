class UsersController < ApplicationController

  def user_params
    params.require(:user).permit!
  end

  def new
    # simply renders view
  end

  # noinspection RailsChecklist01
  def create
   if User.user_id_exists? user_params[:user_id]
     flash[:warning] = 'Sorry, that user id is taken already. Please try again'
     redirect_to new_user_path
   else
     @user = User.create_user!(user_params)
     flash[:notice] = "Welcome #{@user.email}, your account has been successfully created."
     redirect_to login_path # if successful registration redirect to login page
   end
  end

end
