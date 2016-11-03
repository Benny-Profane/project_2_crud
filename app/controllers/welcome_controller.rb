class WelcomeController < ApplicationController
  def index
    @posts = Post.sorted
    @comments = Comment.all
  end
end
