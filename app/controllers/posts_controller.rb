class PostsController < ApplicationController
  before_action :set_post!, only: %i[show destroy edit update]

  def show
    @comment = @post.comments.build
    @comments = Comment.order created_at: :desc
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to root_path
  end

  def edit
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    authorize @post
    if @post.update post_params
      redirect_to posts_path
    else
      render :edit
    end
  end

  def index
    @posts = Post.order(created_at: :desc).page params[:page]
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit( :title, :body, :avatar)
  end

  def set_post!
    @post = Post.find_by id: params[:id]
  end
end