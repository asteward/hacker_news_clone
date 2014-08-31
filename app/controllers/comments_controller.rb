class CommentsController < ApplicationController

  before_filter :authorize, only: [:new, :create]

  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to user_post_path(@post.user, @post)
    else
      flash[:alert] = "<strong>Oops!</strong> Don't forget to actually type in a comment."
      redirect_to user_post_path(@post.user, @post)
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
