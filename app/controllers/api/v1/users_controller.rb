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
    add_default_lists #references method that will create default lists for user
    render json: @user
  end

  def login #custom route to login an existing user
    @user = User.all.find_by(username: params[:username]) #Search User db to see if a user exists
    if @user.nil? #is the entered username in the db?
      render json: {error: "Username not found"} #if not, render the error
    else
      #if @user.authenticate(params[:password])
      if @user.password == params[:password] #if they are in the db check their password
        render json: @user
      else
        render json: {error: "Your password is invalid"}
      end
    end
  end

  def add_default_lists
    default_list = [{user_id: @user.id, title: "Currently Reading"},
                    {user_id: @user.id, title: "Want to Read"},
                    {user_id: @user.id, title: "Read"}]
    default_list.each{|list| List.create(list)}
  end

  def user_books
    @user = User.find(params[:id])
    @books = @user.books
    render json: @books
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end # class

# Change login method when using bcrypt to authenticate user
