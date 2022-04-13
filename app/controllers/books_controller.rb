class BooksController < ApplicationController
  before_action :authenticate_user! 
  def new
    @book = Book.new
  end
  
  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @users = User.all
    if @book.save
     redirect_to '/books'
    else
     render :index
    end 
  end 
  
  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end 
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @users = User.all
  end 
  
  def edit
    @book = Book.find(params[:id])
    #@book.update(book_params)
  end 
  
  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to user_path(current_user)
  end 
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "You have updated  successfully."
    redirect_to user_path(current_user)
  end 
  
  private
  def book_params
     params.require(:book).permit(:title, :body)
  end
  
end
