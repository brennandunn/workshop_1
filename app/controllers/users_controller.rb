class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def newest
    @users = User.order('created_at desc')
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_username(params[:username])
    render :action => :not_found unless @user
  end

  def create
    @user = User.create(params[:user])
    redirect_to user_path(@user.username)
  end
end

