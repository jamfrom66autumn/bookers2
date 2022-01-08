class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "creating successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      redirect_to user_path(user_id)
    end
  end

  def index
    @books = Book.all
    render 'books/show'
  end

  def show
    @book.user_id = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path
    else
      flash[:alert] = "Updating error."
      redirect_to book_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
