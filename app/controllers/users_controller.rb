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
        @user = User.create(user_params)
        if @user.save && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        if params[:id] && @user = User.find_by_id(params[:id]) && @user = current_user
        else
            flash[:message] = "Must be signed in as user to view user's page!"
            redirect_to :root
        end
        if !current_user.groups.nil?
            @group = Group.new
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
            user = User.find_by_id(params[:id])
            redirect_to groups_path if !user == current_user
            binding.pry 
            group = Group.find(params[:user][:group][:id])
            if params[:commit] == "Leave Group"
                user.groups.delete(group)
                redirect_to user_path(user)
            else
                    user.groups << group
                    redirect_to user_path(user)
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
