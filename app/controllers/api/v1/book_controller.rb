class Api::V1::BookController < ApplicationController
  before_action :find_book, only: [:update, :destroy]

  def index
    @books = Book.all
    render json: @books
  end

  def create
    @book = Book.create(book_params)
    render json: @book
  end

  def destroy
    @book.destroy
    redirect_to api_v1_books_path
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def user_params
    params.require(:book).permit(:title, :author, :genre, :cover_url)
  end
end
