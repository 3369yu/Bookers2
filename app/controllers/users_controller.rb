class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def updete
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introductin, :profile_image)
  end
end
