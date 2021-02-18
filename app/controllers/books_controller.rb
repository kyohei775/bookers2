class BooksController < ApplicationController
  
  def new
   @book = Book.new
   @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to new_book_path
    else
     render :new
    end
  end

  def index
  end

  def show
  end

  def destroy
  end

private
  def book_params
   params.require(:book).permit(:title, :body)
  end

end
