class BlogPostsController < ApplicationController

	before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  def index
  	@blog_post = BlogPost.all
  end

  def show
  	@comment = Comment.new
  end

  def new
  	@blog_post = BlogPost.new
  end

  def edit
  end

  def create
  	@blog_post = BlogPost.new(blog_post_params)

  	respond_to do |format|
  		if @blog_post.save
  			format.html {redirect_to blog_post_path(id: @blog_post.id), notice: "Blog Post was created succesfully"}
  		else
  			format.html { render :new }
  		end
  	end
end
def update
	@blog_post = BlogPost.find(params[:id])

	respond_to do |format|
		if @blog_post.update(blog_post_params)
			format.html {redirect_to blog_post_path(id: @blog_post.id), notice: "Blog post was updated succesfully!"}
		else
			format.html {render :edit }
		end
	end
end

def destroy
	@blog_post.destroy

	respond_to do |format|
		format.html {redirect_to blog_posts_path, notice: "Your blog post was destroyed!!"}
	end
end


private

	def set_blog_post
		@blog_post = BlogPost.find(params[:id])
	end

	def blog_post_params
	params.require(:blog_post).permit(:title, :blog_entry, :author)
	end

end
