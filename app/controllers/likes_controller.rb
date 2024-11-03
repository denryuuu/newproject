class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      current_user.like(@post)
      @like_count = @post.likes.count

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to posts_path }
      end
    end
  
    def destroy
      @post = current_user.likes.find(params[:id]).post
      current_user.unlike(@post)
      @like_count = @post.likes.count

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to posts_path }
      end
    end
end