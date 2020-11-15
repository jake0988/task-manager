class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(:username => params[:user][:username])
        return head[:forbidden] unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
    end

    def show

    end
end
