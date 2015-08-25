class StaticPagesController < ApplicationController
  # before_action :logged_in_user

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
end
