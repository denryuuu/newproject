class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy likes]
  def index
    @q = Post.ransack(params[:q])
    posts = @q.result(distinct: true).includes(:user, :comments,:tag)

    if params[:tag].present?
      posts = posts.joins(:tag).where(tag: { name: params[:tag] })
    end

    @posts = posts.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      logger.debug "Post created with tag_id: #{post_params[:tag_id]}"
      redirect_to posts_path, success: t('defaults.flash_message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      logger.debug "Post updated with tag_id: #{post_params[:tag_id]}"
      redirect_to post_path(@post), success: t('defaults.flash_message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path, success: t('defaults.flash_message.deleted', item: Post.model_name.human), status: :see_other
  end

  def user_posts
    @posts = current_user.posts # 現在ログインしているユーザーの投稿を取得
  end
  
  def likes
    @like_posts = current_user.like_posts.includes(:user).order(created_at: :desc)
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :location_name, :address, :content, :image, :tag_id)
  end
end
