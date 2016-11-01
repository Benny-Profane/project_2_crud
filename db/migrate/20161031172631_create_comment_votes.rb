class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.string :user_id
      t.string :comment_id

      t.timestamps null: false
    end
  end
end
