class PostsController < ApplicationController

	def index
		@posts = Post.all		
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path, notice: "Publicación exitosa!"
		else
			render :new		#If there is no success in the access to de DB, we shall return to the form again
		end
	end

	def update
	  	@post = Post.find(params[:id])
	  	if @post.update(post_params)
	    	redirect_to posts_path, notice: "El post ha sido editado!"
	  	else
	    	render :edit
	  	end
	end

	private
		def post_params
			params.require(:post).permit(:title, :content)
		end
end
