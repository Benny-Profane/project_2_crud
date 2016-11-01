class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.string :user_vote
      t.string :comment_vote

      t.timestamps null: false
    end
  end
end
