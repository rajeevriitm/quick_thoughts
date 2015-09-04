class StaticPagesController < ApplicationController
  before_action :logged_in_user,only: [:personal,:notes,:diary,:home]
  before_action :user_define,only: [:personal,:notes,:diary,:home]

  def home
  end

  def personal
    render 'home'
  end

  def notes
  end

  def diary
    if allowed?(@user)
      render 'home'
    else
      render 'login'
    end
  end
  def auth
    if current_user.authenticate(params[:password])
      authnt(current_user)
      redirect_to diary_path
    else
      @user=current_user
      render 'login'
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  private

  def user_define
    @user=current_user
    @feed=current_user.feed(category_select).paginate(page: params[:page],per_page: 10)
  end

end
