class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.new
    @book = Book.all
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @user = current_user
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end
end