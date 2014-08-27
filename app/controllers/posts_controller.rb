class PostsController < ApplicationController
  def index
    @vote = Vote.new
    @posts = Post.order(:rank)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created."
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = "#{@post.title} upvoted!"
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :link, :votes)
  end
end
