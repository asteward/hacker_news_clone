class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post.new
  end
end
