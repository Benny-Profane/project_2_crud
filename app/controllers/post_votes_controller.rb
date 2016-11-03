class PostVotesController < ApplicationController

  def create
    @postvote = PostVote.new(user_id: current_user.id, post_id: params[:post_id])
    if @postvote.save
      redirect_to root_path, notice: "Great Job!"
    else
      redirect_to root_path, alert: "Failed to upvote!"
    end
  end


end
