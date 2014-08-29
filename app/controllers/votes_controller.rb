class VotesController < ApplicationController
  before_filter :authorize
  def create
    @post = Post.find(params[:post_id])
    @vote = @post.votes.new
    if @vote.save
      flash[:notice] = "Post upvoted."
      redirect_to posts_path
    else
      render 'new'
    end
  end

private
  def vote_params
    params.require(:vote).permit(:post_id)
  end
end
