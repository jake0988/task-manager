class GroupsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]
  

  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end

  def create
    @user = current_user
    group = Group.new(group_params)   
      if @user && !@user.groups.include?(group.name)
        group.save
      flash[:message] = "#{group.name} has been created!"
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def show
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @group = Group.find_by_id(params[:id])
      if @group.goal.nil?
      @goal = @group.goal.build
      end
    elsif params[:user_id]
      flash[:message] = "That user doesn't exist"
      redirect_to action: "index"
    elsif @group = Group.find_by_id(params[:id])
      else
        flash[:message] = "That group doesn't exist"
      redirect_to action: "index"
    end
  end

  def edit
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @group = Group.find_by_id(params[:id])
        # if @user.groups.include?(@group)
          @user.groups.delete(@group)
        # else
          
        #   render :edit
        
        # end
    else
        flash[:message] = "That user doesn't exist"
    end
  end

  def update
    group = Group.find_by_id(params[:id])
    if current_user.groups.include?(group)
                current_user.groups.delete(group)
    else
      group.users << current_user
    end
    redirect_to action: :index
  end

  private
  def group_params
    params.require(:group).permit(
      :name,
      :goal
    )
    end

end