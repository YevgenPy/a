class PostsController < ApplicationController
  before_action :set_post!, only: %i[show destroy edit update]

  def show
    @comment = @post.comments.build
    @comments = Comment.order created_at: :desc
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def edit
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    if @post.update post_params
      redirect_to posts_path
    else
      render :edit
    end
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit( :title, :body)
  end

  def set_post!
    @post = Post.find_by id: params[:id]
  end
end