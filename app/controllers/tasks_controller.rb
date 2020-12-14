class TasksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @task = Task.all
    @user = User.find_by(id: current_user.id)
  end

  def new
   @task = Task.new
   @user = User.find_by(:id => session[:user_id])
  end

  def create
    @task = current_user.tasks.build(task_params)
    user = User.find_by(id: session[:id])
    @task.start_time = Time.current 
    current_user.tasks << @task

      redirect_to user_path(current_user)
  end

  def edit
    @task = Task.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def update
    task = Task.find_by(user_id: session[:user_id], id: params[:task][:id])
    task.update(task_params)
    user = User.find_by(id: session[:user_id])
    redirect_to user_path(user)
  end


  private
    def task_params
      params.require(:task).permit(
      :id,
      :user_id,
      :name,
      :comment,
      :startime,
      :category_name,
      :group_name
      )
    end
end