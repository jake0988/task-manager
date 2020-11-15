class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        current_user ||= User.find_or_create_by(:username => params[:user][:username])
    end
end