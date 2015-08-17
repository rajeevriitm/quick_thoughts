class ThoughtsController < ApplicationController
  before_action :logged_in_user
  def idex
  end

  def create
    thought=current_user.thoughts.build(content: params[:thought][:content])
    if thought.save
      flash[:info]="Thought has been added.."
    else
      flash[:danger]=" Unable to add thought"
    end
    redirect_to request.referrer ||root_url

  end

  def show
  end

  def edit
    @thought=Thought.find_by(id: params[:id])
    respond_to do |format|
      format.html {render 'shared/thoughts_form'}
      format.js
    end

  end
end
