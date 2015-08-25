class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show,:edit]
  def new
    @user=User.new
  end
  def edit
    @user=User.find_by(id: params[:id])
  end
  def create
    @user=User.new(user_params)
    if @user.save
      login @user
      flash[:info]="Welcome to QuickThoughts"
      redirect_to user_path(@user)
    else
      render 'static_pages/home'
    end
  end
  def show
    @user=User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:about,:picture)
  end
end
