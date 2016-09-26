class UsersController < ApplicationController

  def user_params
    params.require(:user).permit!
  end

  def show

  end

  def index

  end

  def new
    # simply renders view
  end

  # noinspection RailsChecklist01
  def create
   if User.user_id_exists? user_params[:user_id]
     flash[:notice] = "Sorry, that user id is taken already. Please try again"
     redirect_to users_path
   else
     @user = User.create_user!(user_params)
     flash[:notice] = "Welcome #{@user.email}, your account has been successfully created."
     redirect_to login_path # if successful registration redirect to home page
   end

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
