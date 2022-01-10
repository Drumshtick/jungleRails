class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # authenticate_with_credentials(params[:email], params[:password])
    # user exists, password exists
    if user && user.authenticate(params[:password])
      # Create session cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
    # On fail boot back to login
      redirect_to '/login'
    end
  end

  def destroy
    # On logout destroy session cookie
    session[:user_id] = nil
    # Boot 'em to login
    redirect_to '/login'
  end
end
