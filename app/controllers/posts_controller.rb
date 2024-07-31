class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('defaults.flash_message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :location_name, :address, :content, :image)
  end
end
