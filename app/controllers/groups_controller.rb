class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @group = Group.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    @group = Group.create(group_params)
    binding.pry
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