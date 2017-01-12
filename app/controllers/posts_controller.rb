class PostsController < ApplicationController
    before_action :authorize, except: [:index, :show]

  def index
     # @posts = Post.all
  end

  def new
     # @posts = Post.all
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
     # The show route to a post will be an active link to the content-URL
     # @posts = Post.all
     @post = Post.find(params[:id])
     @user = @post.user
     @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def update
    @post = Post.find(params[:id])
     if @post.update_attributes(post_params)
      redirect_to user_post_path(@post.user_id, @post.id)
      else
      render 'new'
     end
  end

  def destroy
     @user = User.find(params[:user_id])
     @post = Post.find(params[:id])
     @post.destroy
     flash[:notice] = "No worries #{@user.name}. We get it. Your post has been deleted."
     redirect_to root_path
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
