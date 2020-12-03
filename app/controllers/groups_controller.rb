class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
    if session[:user_id]
    @user = User.find_by(id: session[:user_id])
    else
      flash[:message] = "User must be logged in to view groups"
      redirect_to '/'
    end
  end

  def new
    @group = Group.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    @group = Group.create(group_params)
    
    redirect_to user_path(user)
  end

  def show
    user = User.find_by(id: session[:user_id])
    if user && user.authenticate(session[:user_id])
      @group = Group.find_by(params[:id])
      task = find_by(id: params[:task_id])
    else
      redirect_to '/'
    end
  end

  def edit
    @group = Group.find_by(id: params[:id])
  end

  def update
    group = Group.find_by(id: params[:id])
    group = Group.update(group_params)
    redirect_to user_path(session[user_id])
    binding.pry
  end

  private
  def group_params
    params.require(:group).permit(
      :name,
      task: [
        :name
      ]
    )
    end
end