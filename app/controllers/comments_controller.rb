class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_to post_path(@comment.post.id)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
  
end
