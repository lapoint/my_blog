class PostsController < ApplicationController
	before_action :authenticate_user!

	def index
		#Post.all
		@posts = current_user.posts
	end

#contains a form for creating a new post:
	def new   
		@post = Post.new
	end

#actually creates a record in the database and redirects
	def create
		@post = Post.new(post_params)
		@post.user = current_user

		if @post.save
			redirect_to posts_path
		else
			render	:new
		end
	end

	def edit
		@post = current_user.posts.find(params[:id])
	end

	def update
		@post = current_user.posts.find(params[:id])
		# @post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to posts_path
		else
			render :edit
	end
	
	def destroy
		post = current_user.posts.find(params[:id])
		#post = Post.find(params[:id])
		post.destroy

		redirect_to posts_path
	end
end

#for strong params
private

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end

end
