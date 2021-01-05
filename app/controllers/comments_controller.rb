class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
  end

  def edit
    binding.pry
    if params[:group_id]
    if @task = GroupTask.find_by(id: params[:id])
      @comment = Comment.find_or_create_by(content: @task.comment)
      @group = current_group
    else
      flash[:message] = "Task does not exit"
      redirect_to group_path(current_user)
    end
  elsif params[:task_id]
    @task = Task.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
    @task.comment = params[:comment]
    if @task.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  else
    flash[:message] = "Something went wrong with your comment"
    redirect_to root
  end
  end

  def update
    binding.pry
  end

  def destroy
  end

  def private
    params.require(:comment).permit(
      :content
    )
  end
end
