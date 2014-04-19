class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def new
    @comment = @post.comments.build
  end
  
  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment has been saved."
      redirect_to @post
    else
      flash[:alert] = "Comment has not been saved."
      render "new"
    end
  end
  
  private
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit( :content, :author)
  end
end