class BooksController < ApplicationController
  def index
    @books = Book.order('title ASC')
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to(books_path, notice: "Added Book")
    else
      render('new')
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to(book_path(@book), notice: "Updated Book")
    else
      render('edit')
    end

  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to(books_path, notice: "Deleted Book")
  end

  private

    def book_params
      params.require(:book).permit(
        :title,
        :author,
        :genre,
        :price,
        :published_date
      )
    end


end
