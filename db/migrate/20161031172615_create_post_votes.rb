class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.string :user_id
      t.string :post_id

      t.timestamps null: false
    end
  end
end
