class GoalsController < ApplicationController
  

  def new
    if @var = params[:group_id]
      @var = Group.find_by_id(params[:group_id])
      @goal = @var.goals.build
    else
      @var = current_user  
      @goal = current_user.goals.build
    end
  end

  def create
    @user = current_user
    if params.has_key?(:group_id)
      @group = Group.find_by_id(params[:group_id])  
      
      if @group.goal
        @group.goal.destroy
      end
      @goal = Goal.create(goal_params)
      @group.goal = @goal
      
      if @group.save
        redirect_to group_path(@group)
      else
        render :new
      end
    else
      @goal = current_user.goals.build(goal_params)
      
      if @goal.save
        redirect_to user_path(@user)
      else  
        render :new
      end
    end
  end

  def edit
    if params[:group_id]
      @group = Group.find_by_id(params[:group_id])
      @goal = @group.goal.build
    else
      @user = current_user
      @goal = current_user.goal.build
    end
  end

  def update
    @group = current_group
    @group.goal.update(goal_params)
    redirect_to request.referrer
  end
    
  def destroy
    goal = Goal.find_by_id(params[:id])
    goal.delete
  end
  
  private

  def goal_params
    params.require(:goal).permit(
      :name,
      :group_id,
      :goal,
      :user_id,
      :id
    )
  end
end
