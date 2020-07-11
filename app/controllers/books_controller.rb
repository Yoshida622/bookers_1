class BooksController < ApplicationController
  def root
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
       redirect_to book_path(book.id), notice: 'successfully'
    else
       @books = Book.all
       @book = Book.new
       flash.now[:alert] = "error"
       render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       redirect_to book_path(book.id), notice: 'successfully'
    else
       @book = Book.find(params[:id])
       flash.now[:alert] = "error"
       render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
