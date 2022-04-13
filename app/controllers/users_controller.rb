class UsersController < ApplicationController
  before_action :authenticate_user! 
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end 
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(params[:id])
    flash[:notice] = "You have updated user successfully."
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end 
  
  
end