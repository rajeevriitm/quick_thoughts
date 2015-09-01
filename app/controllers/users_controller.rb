class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show,:edit,:update,:index]
  before_action :correct_user,only: [:edit,:update]

  def index
    @user=current_user
    @users=User.all.paginate(page: params[:page],per_page: 30)
    respond_to do |format|
      format.html
      format.json {render json:@users}
    end
  end
  def new
    @user=User.new
  end
  def edit
    @user=User.find_by(id: params[:id])
  end
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:info]="Successfully edited"
      redirect_to root_url
    else
      render 'edit'
    end
  end
  def create
    @user=User.new(user_params)
    if @user.save
      login @user
      flash[:info]="Welcome to QuickThoughts"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  def show
    @user=User.find_by(id: params[:id])
    @feed=@user.feed("Home").paginate(page: params[:page],per_page: 10)
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:about,:picture)
  end
  def correct_user
    redirect_to :back unless @user==current_user
  end

end

