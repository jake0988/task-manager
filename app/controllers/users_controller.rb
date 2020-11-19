class UsersController < ApplicationController
    def index
        render :home
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        group = Group.create
        @user.group = group
        if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end

    def show
        if session[:user_id]
           @user = User.find(session[:user_id])  
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
        :group_id,
        :admin
        # group_attributes: [
        #     :name
        # ]
        )
    end
end
