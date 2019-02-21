class Api::V1::ResponsesController < ApplicationController
  before_action :find_response, only: [:update, :destroy]

  def index
    @responses = Response.all
    render json: @responses
  end

  def create
    @response = Response.create(response_params)
    render json: @response
  end

  def update
    if @response.update(response_params)
      render json: @response
    else
      render json: { errors: @response.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @response.destroy
    redirect_to api_v1_responses_path
  end

  private

  def find_response
    @response = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:title, :content)
  end
end
