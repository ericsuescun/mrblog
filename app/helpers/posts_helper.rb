module PostsHelper
	def form_title
	  @post.new_record? ? "Postear" : "Editar Post"
	end
end
