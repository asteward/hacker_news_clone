class VotesController < ApplicationController
  
  before_filter :authorize

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @vote = @post.votes.new(vote_params)
    if @vote.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

private
  def vote_params
    params.require(:vote).permit(:post_id, :user_id)
  end
end
