class Api::V1::ListsController < ApplicationController
  before_action :find_list, only: [:update, :destroy]

  def index
    @lists = List.all
    render json: @lists
  end

  def create
    @list = List.create(list_params)
    render json: @list
  end

  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to api_v1_lists_path
  end

  def add_book
    # byebug
    @list = List.all.find_by(:id == params[:id])
    @book = Book.all.find_or_create_by(google_id: params[:google_id]) do |book| #find a book by unique google id, if it doesn't exist, create it with the following attributes/params.
      book.title = params[:title]
      book.authors = params[:authors]
      book.cover_url = params[:cover_url]
    end
    @list.books << @book
    render json: @list

    # STRETCH: if the book exists in their db, remove it from their former list and add it to the new list
  end


  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
