class GroupsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]
  

  def index
      @groups = Group.all
  end
  
  def new
    @group = Group.new
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @user = User.find_by(id: session[:user_id])
    group = Group.new(group_params)    
      if @user && !@user.groups.include?(group.name)
        group.save
      #   @user.groups << group
      flash[:message] = "#{group.name} has been created!"
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  # def show
  #   user = User.find_by(id: session[:user_id])
  #   binding.pry
  #   if params[:user_id] && User.find_by_id(params[:user_id])
  #     @groups = user.groups
  #   else
  #     flash[:message] = "That user doesn't exist"
  #     redirect_to ':index'
  #   end
  # end

  def edit
    @user = User.find_by(id: current_user.id)
    if params[:user_id] && User.find_by_id(params[:user_id])
          @groups = @user.groups
    else
          flash[:message] = "That user doesn't exist"
          redirect_to ':index'
    end
  end

  def update
    group = Group.find_by(id: params[:id])
    group = Group.update(group_params)
    redirect_to user_path(session[user_id])
  end

  def show
    @group = Group.find_by_id(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(
      :name,
      task: [
        :name
      ]
    )
    end

end