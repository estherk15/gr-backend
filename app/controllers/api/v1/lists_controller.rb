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

  private

  def find_list
    @list = List.find(params[:id])
  end

  def user_params
    params.require(:list).permit(:title, :description)
  end
end
