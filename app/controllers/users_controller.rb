class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :new, :create]

    def index
        render :home
    end

    def new
        @user = User.new
    end

    def create
        binding.pry
        @user = User.create(user_params)
        if @user.save && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            binding.pry
            redirect_to @user
        else
            render :new
        end
    end

    def show
        if params[:id] && @user = User.find_by_id(params[:id])     
            @categories = @user.category_array if @user.category_array
            @groups = Group.all
        else
            flash[:message] = "Must be signed in as user to view user's page!"
            redirect_to :root
        end
    end

    def edit
        if params[:id] && @user = User.find_by_id(params[:id])
            render :edit
        else
            flash[:message] = "Must be signed in as user to edit user's page!"
            redirect_to :root
        end
    end

    def update
        if user = User.find_by(id: session[:user_id])
            group = Group.find(params[:user][:group][:id])
            if params[:commit] == "Leave Group"
                user.groups.delete(group)
                redirect_to user_path(user)
            else
                if group.tasks.empty?
                    flash[:message] = "A Group must have a task and its category before joining. First assign a task with a category to your Group."
                    redirect_to new_user_task_path(user)
                else
                    user.groups << group
                    redirect_to user_path(user)
                end
            end
        else
            flash[:message] = "User must sign in before updating profile"
            redirect_to '/'
        end
    end

    private

    def user_params
        params.require(:user).permit(                            
          :username,
          :password,
          :email,
          :admin,
          group_ids:[],
          group: [
              :name
          ],
          tasks_attributes: [ 
          :comment,
          :complete
          ]
        )
    end

end
