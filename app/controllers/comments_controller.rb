class CommentsController < ApplicationController

  before_filter :authorize, only: [:new, :create]

  def index
    @comment = Comment.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment added."
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
