class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:update, :destroy]

  def index
    @books = Book.all
    render json: @books
  end

  def create
    @book = Book.create(book_params)
    render json: @book
  end

  def update
    list = List.find(params[:list_id])
    @book.update(:list => list)

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

  def book_params
    params.require(:book).permit(:google_id, :title, :authors, :cover_url, :list_id) #:author, :genre,
  end
end
