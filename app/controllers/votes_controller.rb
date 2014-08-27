class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
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
