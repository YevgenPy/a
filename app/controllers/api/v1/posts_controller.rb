class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts, status: 200
  end

  def create
    post = Post.new(
      title: pos_params[:title],
      body: pos_params[:body],
      mail_if_comment: pos_params[:mail_if_comment]
    )
    if post.save
      render json: post, status: 200
    else
      render json: {error: "Error creating review"}
    end
  end

  def show
    post = Post.find_by(id: params[:id])
    if post
      render json:post, status: 200
    else
      render json: {error: "Post Not Found."}
    end
  end

  private

  def pos_params
    params.require(:post).permit([
      :title,
      :body,
      :mail_if_comment
                                 ])
  end
end
