class BooksController < ApplicationController
  
  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to  new_book_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to  new_book_path
    else
      if @book.update(book_params)
        redirect_to new_book_path
      else
        render :edit
      end
    end
  end
  
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
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to  new_book_path
    else
      @book.destroy
    end
  end

private
  def book_params
   params.require(:book).permit(:title, :body)
  end

end
