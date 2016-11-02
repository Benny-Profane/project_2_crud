class PostsController < ApplicationController
    before_action :authorize, except: [:index, :show]

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
     @post = Post.find(params[:id])
     @user = @post.user
     @comments = @post.comments
  end

  def edit
    # binding.pry
    @post = Post.find(params[:id])
    @user = @post.user
    # Query user's post array for post
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
     # binding.pry
     @user = User.find(params[:user_id])
     @post = Post.find(params[:id])
     @post.destroy
     flash[:notice] = "No worries #{@user.name}. Your post has been turned into compost (hehe)."
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
