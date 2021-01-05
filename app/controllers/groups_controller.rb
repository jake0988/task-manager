class GroupsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]
  

  def index
    @user = current_user
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)   
    @group.users << current_user
    
    if @group.save
      flash[:message] = "#{@group.name} has been created!"
      render :show
    else
      render :new
    end
  end

  def show
    if @group = Group.find_by_id(params[:id])
    
      if @group.users.include?(current_user)
    
      else
        flash[:message] = "You are not a member of that group"
        redirect_to action: "index"
      end
    
    else
      flash[:message] = "That Group doesn't exist."
      redirect_to action: "index"
    end
  end

  def edit
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @group = Group.find_by_id(params[:id])
        @user.groups.delete(@group)
    else
        flash[:message] = "That user doesn't exist"
    end
  end

  def update
    @group = Group.find_by_id(params[:id])
    if current_user.groups.include?(@group)
                current_user.groups.delete(@group)
    else
      @group.users << current_user
    end
    redirect_to group_path(@group)
  end

  def destroy
    if @group = Group.find_by_id(params[:id])
      if @group.users.include?(current_user)
        flash[:message] = "#{@group.name} has been deleted"
        @group.delete
      else
        flash[:message] = "Must be a member of #{group.name} to delete"
      end
    end
    redirect_to action: :index
  end

  private
  def group_params
    params.require(:group).permit(
      :name,
      :goal,
      :category_name,
      :id
    )
    end

end