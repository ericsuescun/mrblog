class PostsController < ApplicationController

	def index
		@posts = Post.all		
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path, notice: "Publicación exitosa!"
		else
			render :new		#If there is  no success in the access to de DB, we shall return to the form again
		end
	end

	private
		def post_params
			params.require(:post).permit(:title, :content)
		end
end
