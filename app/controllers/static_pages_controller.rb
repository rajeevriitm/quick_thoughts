class StaticPagesController < ApplicationController
  before_action :logged_in_user,only: [:personal,:notes,:diary]
  before_action :user_define,only: [:personal,:notes,:diary,:home]

  def home
  end

  def personal
    render 'home'
  end

  def notes
    render 'home'

  end

  def diary
    render 'home'
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
  end

end
