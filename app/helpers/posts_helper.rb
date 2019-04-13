module PostsHelper
	def form_title
	  @post.new_record? ? "Crear Post" : "Editar Post"
	end

	def find_email(id)
		@users.find(id).email
	end
end
