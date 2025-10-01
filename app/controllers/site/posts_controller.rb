class Site::PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]
  before_action :set_post, only: %i[ show edit update destroy ]
  
  def index
    @posts = Post.all.reverse
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.creator = current_user

    if post.save
      redirect_to posts_path, notice: "Post created sucessfully!"
    else
      redirect_to :new
    end 
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated sucessfully!"
    else
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post.destroy()
    redirect_to posts_path, notice: "Post deleted sucessfully."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(%i[ title content ])
  end

end
