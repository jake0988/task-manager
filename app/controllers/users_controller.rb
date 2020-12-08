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
        @user = User.find(session[:user_id])
        @categories = @user.category_array if @user.category_array
        @groups = Group.all
    end

    def edit
        @user = User.find_by(id: session[:user_id])
    end

    def update
        if user = User.find_by(id: session[:user_id])
            user.update(user_params)
            redirect_to user_path(user)
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
          groups: [
              :name
          ],
          tasks_attributes: [ 
          :comment,
          :complete
          ]
        )
    end

end
