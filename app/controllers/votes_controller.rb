class VotesController < ApplicationController

  before_filter :authorize

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @vote = @post.votes.new(vote_params)
    unless @vote.save
      flash[:alert] = "<strong>Whoa, Nelly!</strong> Only one vote per user!".html_safe
    end
    redirect_to posts_path
  end

private
  def vote_params
    params.require(:vote).permit(:post_id, :user_id)
  end
end
