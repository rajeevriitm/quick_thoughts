class SessionsController < ApplicationController
  def create
    user=User.find_by(email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      login user
      remember(user) if params[:session][:remember] == "1"
      redirect_to user
    else
      flash.now[:danger]= "Invalid username or password"
      render 'static_pages/home'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
  end
end
