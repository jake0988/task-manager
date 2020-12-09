class SessionsController < ApplicationController
  
    def new
    end

    def create
        
        if auth['uid']
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
            end
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:message] = "Incorrect login"
                redirect_to '/login'
            end
        end
        
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
  
end