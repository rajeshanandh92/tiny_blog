class CommentsController < ApplicationController
  def create
  	@post = set_post
  	@comment = @post.comments.build(comment_params)
  	@comment.save

  	redirect_to @post
  end

  def destroy
  	@comment = set_comment
  	@comment.destroy

  	redirect_to @comment.post  	
  end

  def edit
  	@post = set_post
  	@comment = @post.comments.build(comment_params)
  	@comment.update_attribute(@comment)

  	redirect_to @post
  end

  def index
  	 @post = set_post
  	 redirect_to @post
  end

  def show
  	 @post = set_post
  	 redirect_to @post
  end

  private
  	def set_post
  		@post = Post.find(params[:post_id])
  	end

  	def set_comment
  		@comment = Comment.find(params[:id])
  	end

  	def comment_params
      params.require(:comment).permit(:page_id, :content)
    end
end
