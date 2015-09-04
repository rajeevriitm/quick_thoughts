class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show,:edit,:update,:index,:following]
  before_action :correct_user,only: [:edit,:update]
  before_action :users_list,only: :index

  def index
    @user=current_user
    respond_to do |format|
      format.html { @users=@list.paginate(page: params[:page],per_page: 15)
        render 'index'}
        format.json {render json:@list}
      end
    end
    def new
      @user=User.new
    end
    def edit
    end
    def update
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
      respond_to do |format|
        format.html {@feed=@user.feed("Home").paginate(page: params[:page],per_page: 10)}
        format.json {users_list
          render json:@list}
        end
      end
      def following
        @user=User.find_by(id: params[:id])
        @users=@user.followings.paginate(page: params[:page],per_page: 15)
        render 'index'
      end
      def followers
        @user=User.find_by(id: params[:id])
        @users=@user.followers.paginate(page: params[:page],per_page: 15)
        render 'index'
      end


        private
        def user_params
          params.require(:user).permit(:name,:email,:password,:password_confirmation,:about,:picture)
        end
        def correct_user
          @user=User.find_by(id: params[:id])
          redirect_to(root_url) unless right_user(@user)

        end
        def users_list
          if params[:search]
            @list=User.where('lower(name) like ?',"%#{params[:search].downcase}%")
          else
            @list=User.all
          end
        end


      end

