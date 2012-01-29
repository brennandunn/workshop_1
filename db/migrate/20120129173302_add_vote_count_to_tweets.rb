class AddVoteCountToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :vote_count, :integer, :default => 0

  end
end
