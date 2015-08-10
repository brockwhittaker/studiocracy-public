class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_filter :require_permission, only: :destroy

  def like
    @comment = Comment.find(params[:id])
    @comment.liked_by current_user
    redirect_to :back
  end

  def unlike
    @comment = Comment.find(params[:id])
    @comment.unliked_by current_user
    redirect_to :back
  end
  
  def dislike
    @comment = Comment.find(params[:id])
    @comment.disliked_by current_user
    redirect_to :back
  end

  def undislike
    @comment = Comment.find(params[:id])
    @comment.undisliked_by current_user
    redirect_to :back
  end

  def childify
    @parent = Comment.find(params[:id])
    @child = params[:comment]
    @child.move_to_child_of(@parent)
  end


  def require_permission
    if current_user != Comment.find(params[:id]).user
      flash[:alert] = "that's not your comment"
      redirect_to :back
    end
  end

  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    if @comment.save
      redirect_to :back, :notice => "comment saved"
    else
      flash[:alert] = "unable to save comment"
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to :back, :notice => "comment deleted"
    else
      flash[:alert] = "error deleting comment"
    end
  end
end