class DropCommentsAndVotes < ActiveRecord::Migration
  def change
    drop_table :comment_hierarchies
    drop_table :comment_votes
    drop_table :comments
    drop_table :post_votes
  end
end
