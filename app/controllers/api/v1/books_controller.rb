class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:update]

  def index
    @books = Book.all
    render json: @books
  end

  # def create
  #   @book = Book.create(book_params)
  #   render json: @book
  # end

  def update
    #
    list = List.find_by(user_id: params[:user_id], title: params[:title])
    @book.update(list: list)

    render json: @book
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:google_id, :title, :authors, :cover_url, :description, :info_link, :list_id) #:author, :genre,
  end
end
