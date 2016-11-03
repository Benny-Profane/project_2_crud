class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_votes, dependent: :destroy

  def self.sorted
    posts = Post.all
    posts = posts.sort{|right, left| left.post_votes.length <=> right.post_votes.length}
  end

end
