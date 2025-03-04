class CommentsController < ApplicationController
  before_action :require_login, only: %i[create destroy]
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      render turbo_stream: turbo_stream.append("table-comment", partial: "comments/comment", locals: { comment: @comment })
    else
      render turbo_stream: turbo_stream.replace("comment-form", partial: "comments/form", locals: { comment: @comment })
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    render turbo_stream: turbo_stream.remove("comment-#{@comment.id}")
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
