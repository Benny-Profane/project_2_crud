class WelcomeController < ApplicationController
  def index
    # Sorted refers to vote count tally
    @posts = Post.sorted
    @comments = Comment.all
  end
end
