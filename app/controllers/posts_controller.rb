class PostsController < ApplicationController

  def index

  end

  def new
     @user = User.find(params[:user_id])
     @post = @user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to root_path, notice: "Post created!"
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(
        :title,
        :content,
        :votes
        )
    end

end
