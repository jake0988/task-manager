class UsersController < ApplicationController
    def index
        render :home
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
    end

    private

    def user_params
        params.require(:user).permit(:username,
        :password,
        :email,
        :group_id,
        :admin
        )
    end
end
