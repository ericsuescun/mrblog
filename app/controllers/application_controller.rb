class ApplicationController < ActionController::Base
	def sign_in(user)
	  cookies.permanent.signed[:user_id] = user.id
	  @current_user = user
	end

	def sign_out
	  cookies.delete(:user_id)
	  @current_user = nil
	end

	def private_access
	  redirect_to :login unless signed_in?
	end

	def public_access
	  redirect_to root_path if signed_in?
	end

	private
	  def signed_in?
	    !current_user.nil?
	  end
	  helper_method :signed_in?	#Because is needed to be called from views! Helpers is just for views, but this methods are written here so they can be accesses from the entire App

	  def current_user
	    @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
	  rescue ActiveRecord::RecordNotFound
	  end
	  helper_method :current_user	#Because is needed to be called from views!
end
