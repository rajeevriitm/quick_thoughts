class ThoughtsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,only: [:edit,:update,:destroy]

  def create
    thought=current_user.thoughts.build(thought_params)
    if thought.add_tags(params[:thought][:tag_list])
      flash[:info]="Thought has been added.."
    else
      flash[:danger]=" Unable to add thought"
    end
    redirect_to request.referrer ||root_url

  end

  def edit
    # @thought=Thought.find_by(id: params[:id])
    respond_to do |format|
      format.html {render 'shared/thoughts_form'}
      format.js
    end
  end

  def update
    if @thought.save
      flash[:info]= "Thought updated"
      redirect_to request.referrer
    end
  end

  def destroy
    @thought.destroy
    redirect_to :back
  end

  private

  def thought_params
    params.require(:thought).permit(:content,:tag_list,:category,:title)
  end

  def correct_user
    if @thought=Thought.find_by(id: params[:id])
    unless current_user == @thought.user
      flash[:danger]= "Not allowed "
      redirect_to root_url
    end
  else
    flash[:danger]= "Thought removed"
    redirect_to :back
  end
  end



end
