class TweetsController < ApplicationController
  before_filter :load_user
  before_filter :load_tweet, :except => [:create]

  def edit
  end

  def awesome
  end

  def create
    @tweet = @user.tweets.create params[:tweet]
    redirect_to user_path(@user.username)
  end

  def update
    @tweet.update_attributes params[:tweet]
    redirect_to user_path(@user.username)
  end

  def destroy
    @tweet.destroy
    redirect_to user_path(@user.username)
  end


  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_tweet
    @tweet = @user.tweets.find(params[:id])
  end
end
