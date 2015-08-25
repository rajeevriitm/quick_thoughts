class ApplicationController < ActionController::Base
  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger]="Please login"
      redirect_to root_path
    end
  end
  def store_location
    session[:request_url]=request.url if request.get
  end
  def redirect_back_or(default)
    redirect_to(session[:request_url] || default)
    session.delete(:request_url)
  end
end
