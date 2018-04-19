class CommentsController < ApplicationController

	before_action :set_comment, only: [:edit, :update, :destroy]

  def edit
  	  end

  def create 
  	@coment = comment.new(comment_params)

  	respond_to do |format|
  		if @comment.save
  			format.html { redirect_to_blog_post_path(id: comment.blog_post_id), notice: "Comment was created successfully!!" }

  		else
  			format.html { redirect_back(fallback_location: root_path, notice: "Comment failed to post!")}
  		end
  	end
  end

  def update
  	
  	respond_to do |format|
  		if @comment.update(comment_params)
  			format.html{ redirect_to blog_post_path(id: @comment_blog_post_id), notice: "Comment was updated succesfully!"}
  		else
  			format.html { render :edit}
  		end
  	end
  end
  def destroy
  	
  	@comment.destroy

  	respond_to do |format|
  		format.html{ redirect_to_blog_post_path(id: @comment_blog_post_id), notice: "Your comment was destroyed!"}
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:author, :comment_entry, :blog_post_id)
  end

  def set_comment
  	@comment = Comment.find(params[:id])
  end

end
