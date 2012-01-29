class TweetsController < ApplicationController
  before_filter :load_user
  before_filter :load_tweet, :except => [:create, :new]

  def edit
  end

  def vote
    session[:voted_on] ||= []
    unless session[:voted_on].include?(@tweet.id)
      @tweet.vote_count += 1
      @tweet.save
      session[:voted_on] << @tweet.id
    end
    redirect_to user_path(@user.username)
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
