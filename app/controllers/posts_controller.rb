class PostsController < ApplicationController

  def index
    @posts = Post.search(params[:search]).page(params[:page]).per(3)
    @user = current_user
    @users = User.all
  end
  
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    # binding.pry
    if post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = current_user.comments.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      rendere :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path, notice: "投稿を削除しました"
  end

  private
  def post_params
    params.require(:post).permit(:image, :decription).merge(user_id: current_user.id)
  end
end
