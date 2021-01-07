class GroupTasksController < ApplicationController
    before_action :redirect_if_not_logged_in
  
    def new
      if current_group
        @group = current_group if current_group.users.include?(current_user)
        # @group = Group.find_by_id(params[:id])

        @task = @group.group_tasks.build
      else
        @error = "That task doesn't exist."
        redirect_to '/'
      end
    end
  
    def create
        if current_group.users.include?(current_user)
          @group = current_group 
          @task = @group.group_tasks.build(group_task_params)
          if @group.save 
          flash[:message] = "#{@group.group_tasks.last.name} created"
          redirect_to group_path(@group)
          else
            render :new
          end
        else
          flash[:message] = "Must be a Group member."
          redirect_to groups_path
        end
    end
  
    def edit
      if @task = GroupTask.find_by(id: params[:id])
      @group = Group.find_by_id(params[:group_id])
      if params[:complete] && params[:complete] == "true"
          @task.complete = true
          @task.save
        redirect_to group_path(@group)
      end
    else
      flash[:message] = "Task does not exit"
      redirect_to group_path(current_user)
    end
    end
  
    def update
      if @group = Group.find_by_id(params[:group_id])
        @task = GroupTask.find_by_id(params[:id])
        if @task.update(group_task_params)
        redirect_to group_path(current_group)
        else
        render :edit
        end
      else
        flash[:message] = "Invalid URL"
        redirect_to groups_path
      end
    end

    def destroy
      task = GroupTask.find_by_id(params[:id])
      if current_group.group_tasks.include?(task)
        flash[:message] = "#{task.name} deleted"
        task.delete
      end
      redirect_to "/groups/#{current_group.id}"
    end
  
  
    private
      def group_task_params
        params.require(:group_task).permit(
        :id,
        :name,
        :comment,
        :category_name,
        :group_name,
        :group_id
        )
      end
end
