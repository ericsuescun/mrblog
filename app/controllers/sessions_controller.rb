class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])	#Because we specified has_secure_password, Rails brings authenticate automatically
      sign_in(user)
      redirect_to root_path
    else
      render :new
    end
  end

end
