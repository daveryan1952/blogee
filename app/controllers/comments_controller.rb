class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_as!(user)
  before_action :require_signin!, except: [:show, :index]
 
  def new
    @comment = @post.comments.build
  end
  
# def edit
#    @comment = Comment.find(comment_params)
#   @comment = @post.comments.find(params[:id])
# end
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment has been saved."
      redirect_to @post
    else
      flash[:alert] = "Comment has not been saved."
      render "new"
    end
  end
  
  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment has been updated."
      redirect_to @post
    else
      flash[:alert] = "Comment has not been updated."
      render "new"
    end
  end
  
#  def destroy
#  @post = Post.find(params[:post_id])
#   @comment = @post.comments.find(params[:id])
#   @comment.destroy
#   redirect_to post_path(@post)
    
    def destroy
      @comment.destroy
      flash[:notice] = "Comment has been deleted."
      redirect_to @post

  end
  
  private
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def set_comment
#   @comment = Comment.find(params)
#   @comment = Comment.find(params[:id])
    @comment = @post.comments.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit( :content, :author)
  end
end