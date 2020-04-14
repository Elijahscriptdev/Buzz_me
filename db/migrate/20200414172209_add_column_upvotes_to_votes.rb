class AddColumnUpvotesToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :is_upvote, :boolean
    add_column :votes, :is_downvote, :boolean
  end
end
