class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :posts, dependent: :destroy
  has_many :post_votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_votes, dependent: :destroy

end
