class Api::V1::ListsController < ApplicationController
  before_action :find_list, only: [:show, :update, :destroy]

  def index
    @lists = List.all
    render json: @lists
  end

  def show
    render json: @list
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

    @list = List.all.find_by(user_id: params[:user_id], title: params[:list][:title])
    @book = Book.all.find_or_create_by(google_id: params[:google_id]) do |book| #find a book by unique google id, if it doesn't exist, create it with the following attributes/params.
      book.title = params[:title]
      book.authors = params[:authors]
      book.cover_url = params[:cover_url]
      book.description = params[:description]
    end
    @list.books << @book
    render json: @list
  end

  def change_list
    byebug
    @list = List.find_by(user_id:params[:user_id], title: params[:list][:title])
    @book = Book.find(params[:book_id])
    @book.list = @list
    # @list.books << @book
    render json: @list
  end

  def remove_book
  end


  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
