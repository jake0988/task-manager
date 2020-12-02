class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.build(group_params)

  end

  def show
    user = User.find_by(session[:user_id])
    if user && user.authenticate(session[:user_id])
      @group = Group.find_by(params[:id])
      binding.pry
      task = find_by(id: params[:task_id])
    else
      redirect_to '/'
    end
  end

  private
  def group_params
    params.require(:group).permit(
      :name,
      task: [
        :start
      ]
    )
    end
end