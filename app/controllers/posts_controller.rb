class PostsController < ApplicationController

  before_filter :authorize, only: [:new, :create]

  def index
    @user = current_user
    @vote = Vote.new
    @posts = Post.all
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
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

private
  def post_params
    params.require(:post).permit(:title, :link, :votes)
  end
end
