class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :show, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # def login
  #   @user = User.all.find_by(username: params[:username])
  #    #Search User db to see if a user exists
  #
  #   if @user.nil? #is the entered username in the db?
  #     render json: {error: "Username not found"} #if not, render the error
  #   else
  #     if @user.authenticate(params[:password]) #if they are in the db check their password
  #       render json: @user
  #     else
  #       render json: {error: "Your password is invalid"}
  #     end
  #   end
  # end
  def login

    @user = User.all.find_by(username: params[:username])
     #Search User db to see if a user exists

    if @user.nil? #is the entered username in the db?
      render json: {error: "Username not found"} #if not, render the error
    else
      if @user.password == params[:password] #if they are in the db check their password
        render json: @user
      else
        render json: {error: "Your password is invalid"}
      end
    end
  end

# create a route that accept id of user and return an array of lists with nested books

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
