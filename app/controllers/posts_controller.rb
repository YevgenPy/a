class PostsController < ApplicationController
  before_action :set_post!, only: %i[show destroy edit update]
  respond_to :html, :json

  def show
    @comment = Comment.new(post_id: @post.id, user_id: current_user.id)
    respond_with(@post)
  end

  def destroy
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def edit
    respond_with(@post)
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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
    @posts = Post.order(created_at: :desc)
    respond_to do |format|
      format.html { @posts = @posts.page params[:page]}
      format.json {render json: @posts}
    end
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  private

  def post_params
    params.require(:post).permit( :title, :body, :avatar, :mail_if_comment)
  end

  def set_post!
    @post = Post.find_by id: params[:id]
  end
end
