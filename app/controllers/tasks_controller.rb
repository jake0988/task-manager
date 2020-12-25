class TasksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:user_id] && current_user = User.find_by(:id => params[:user_id])
      @user = current_user
      @task = @user.tasks.build
    else
      @error = "That task doesn't exist."
      redirect_to root
    end
  end

  def create
    @task = current_user.tasks.build(task_params)
    current_user.save
      redirect_to user_path(current_user)
    end

  def edit
    @task = Task.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
    if params[:complete] && params[:complete] == "true"
      if @task.complete == true
        flash[:message] = "Already Completed This Task"
      else
        @task.complete = true
        @task.save
      end
      redirect_to user_path(@user)
    elsif params[:status]
      @task.update(goal: nil)
      redirect_to user_path(@user)
    end
  end

  def update
    task = Task.find_by_id(params[:id])
    task.update(task_params)
    current_user.save
    redirect_to user_path(current_user)
  end

  def destroy
    task = Task.find_by_id(params[:id])
    if current_user.tasks.include?(task)
      task.delete
    end
    redirect_to "/users/#{current_user.id}"
  end

  private
    def task_params
      params.require(:task).permit(      
      :name,
      :comment,
      :category_attributes,
      :goal,
      :status
      )
    end
end