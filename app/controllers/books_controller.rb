class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
       books = Book.all
      render :index
    end
  end

  def updete
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to @book
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
    end
  end

  private

  def book_params
  params.require(:book).permit(:Title, :Opinion)
  end

end
