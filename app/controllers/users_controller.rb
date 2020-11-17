class UsersController < ApplicationController
    def index
        render :home
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
        redirect_to :show
        else
            render :new
        end
    end

    def show
    end
    
    private

    def user_params
        params.require(:user).permit(
        :username,
        :password,
        :email,
        :group_id,
        :admin
        )
    end
end
