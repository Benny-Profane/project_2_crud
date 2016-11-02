class CommentsController < ApplicationController
    before_action :authorize, except: [:index, :show]

  def index
    @comments = Comment.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
     if @comment.save
      redirect_to root_path
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

    def comment_params
      params.require(:comment).permit(
        :content,
        :votes
        )
    end

end
