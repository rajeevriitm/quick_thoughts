class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show,:edit,:update,:index]
  before_action :correct_user,only: [:edit,:update]
  before_action :users_list,only: :index

  def index
    @user=current_user
    respond_to do |format|
      format.html { @users=@list.paginate(page: params[:page])
                          render 'index'}
      format.json {render json:@list}
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
  def users_list
    if params[:search]
      @list=User.where('lower(name) like ?',"%#{params[:search].downcase}%")
    else
      @list=User.all
    end
  end


end

