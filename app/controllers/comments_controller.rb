class CommentsController < ApplicationController
  before_filter :load_post

  def create
    @comment = @post.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created' }
        format.js
      else
        format.html { redirect_to @post, :alert => 'Unable to add comment' }
        format.js { render 'fail_create.js.erb' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @post, :notice => 'Comment deleted' }
      format.js
    end
  end

  private
    def load_post
      @post = Post.find(params[:post_id])    
    end
end
