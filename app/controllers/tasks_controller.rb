class TasksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:user_id] && current_user = User.find_by(:id => params[:user_id])
      @user = current_user
      @task = @user.tasks.build
    else
      @error = "That task doesn't exist."
      @task = Task.all
    end
  end

  def create
    @user = current_user
    #need to validate that category group and name are not already created
    @task = current_user.tasks.build(task_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
    # @task.start_time = Time.current
    # group = Group.find_by_id(params[:group])
    # binding.pry
    # @task.group.tasks.find_or_create_by(user_id: current_user.id, name: @task.name, group_id: group.name)
  end

  def edit
    @task = Task.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
    if params[:complete] && params[:complete] == "true"
      if @task.complete == true
        flash[:message] = "Already Completed This Task"
      else
        @task.complete = true
        @task.save!
      end
      redirect_to user_path(@user)
    end
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
      # :id,
      # :user_id,
      :name,
      # :comment,
      # :startime,
      # :category_id,
      :category_attributes,
      # :complete,
      # :group_id
      :group_attributes
      )
    end
end