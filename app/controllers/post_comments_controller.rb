class PostCommentsController < ApplicationController

	def create
	    blog = Blog.find(params[:blog_id])
	    post_comment = current_user.post_comments.new(post_comment_params)
	    post_comment.blog_id = blog.id
	    post_comment.save
	    redirect_to blog_path(blog)
	end
	  def destroy
        blog = Blog.find(params[:blog_id])
        post_comment = PostComment.find_by(blog_id: params[:blog_id])
	    post_comment.destroy
	    redirect_to blog_path(blog)
	  end
	private
	def post_comment_params
	  params.require(:post_comment).permit(:user_id,
	                      :blog_id,
	                      :comment)
	end
end
