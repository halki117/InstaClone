class LikesController < ApplicationController

  def create
    Like.create(user_id: current_user.id, post_id: params[:id])
    # binding.pry
    redirect_to root_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    redirect_to root_path
  end

  # private
  #   def like_params
  #     params.permit(:post_id)
  #   end
end
