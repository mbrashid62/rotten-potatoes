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

  def create
    @user = User.create_user!(user_params) # todo make sure user id is unique - where to do this?
    flash[:notice] = "Welcome #{@user.email}, your account has been successfully created."
    redirect_to root_path # if successful registration redirect to home page
  end

  def edit

  end

  def update

  end

  def destroy
    
  end
end
