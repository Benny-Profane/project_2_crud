class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.string :user_vote
      t.string :post_vote

      t.timestamps null: false
    end
  end
end
