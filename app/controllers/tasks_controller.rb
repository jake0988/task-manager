class TasksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
  end

  def new
    @task = Task.new
  end

  def create
    if current_user
      # xcatm = Category.find_or_create_by(:name => params[:task][:category][:name])
      @task = current_user.tasks.build(task_params)
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
      category: [
      :name
      ]
      )
    end
end