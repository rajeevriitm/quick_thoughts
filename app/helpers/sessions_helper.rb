module SessionsHelper
  def login(user)
    session[:user_id]=user.id
  end

  def current_user
    if user_id=session[:user_id]
      @current_user ||= User.find_by(id: user_id  )
    elsif user_id=cookies.signed[:user_id]
      user= User.find_by(id: user_id)
      if user && user.authenticated(cookies[:remember_token])
      # raise
        login user
        @current_user=user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  # def correct_user(user)
  #   if current_user != user
  #     flash[:danger]="Not allwed to view the content"
  #     redirect_to root_path
  #   end
  # end

  def logout
    forget current_user
    session.delete(:user_id)
    @current_user=nil
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id]=user.id
    cookies.permanent[:remember_token]=user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  def category_select
    unless action_name=="show"
      action_name.capitalize
    else
      "Home"
    end
  end
end
