class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
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
  
  private
  
  def post_params
    params.require(:post).permit(:title, :location_name, :address, :content, :image)
  end
end
