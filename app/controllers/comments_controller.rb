class CommentsController < ApplicationController
  before_action :set_comment!

  def create
    @comment = @post.comments.build comment_params
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Comment created"
      redirect_to post_path(@post)
    else
      @comments = Comment.order created_at: :desc
      render 'posts/show'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def set_comment!
    @post = Post.find params[:post_id]
  end
end
