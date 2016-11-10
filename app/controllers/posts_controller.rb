class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "Post gelukt"
    else
      render 'new', notice: "Post niet gelukt"
    end
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Post bijgewerkt"
    else
      render 'edit'
    end
  end

  def destory
    @post.destory
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
