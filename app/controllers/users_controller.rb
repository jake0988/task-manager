class UsersController < ApplicationController
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
        
        # redirect_if_not_logged_in
        if session[:user_id]
           @user = User.find(session[:user_id])
           @categories = @user.category_array if @user.category_array
           @groups = Group.all
        else
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
        group: [
            :name
        ]
        )
    end
end
