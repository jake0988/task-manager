class TasksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @task = Task.all
  end

  def new
   @task = Task.new
   @user = User.find_by(:id => session[:user_id])
  end

  def create
    @task = current_user.tasks.build(task_params)
    if current_user
      # xcatm = Category.find_or_create_by(:name => params[:task][:category][:name])
      current_user.tasks << @task
      # task.group = current_user.group
      # id = current_user.id
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private
    def task_params
      params.require(:task).permit(
      :user_id,
      :name,
      :startime,
      :category_name
      )
    end
end