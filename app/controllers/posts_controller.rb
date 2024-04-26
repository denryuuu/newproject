class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿が成功しました'
    else
      render :new
    end
  end
  
  def index
    @posts = Post.all
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :location_name, :address, :post_image)
  end
end
