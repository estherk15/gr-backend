class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:update, :destroy]

  def index
    @books = Book.all
    render json: @books
    # Eventually I want books to be free of all duplicates, I just want one copy of the book, assuming I can have copies of the same book in many lists.
    # @books = Book.all
    # unqi_book = []
    # @books.each do |book|
    #   if !unqi_book.map(|b| b.name).include?(book.name)
    #     unqi_book.push(book)
    #   end
    # end
    # render json: unqi_book
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

  def book_params
    params.require(:book).permit(:google_id, :title, :authors, :cover_url) #:author, :genre,
  end
end
