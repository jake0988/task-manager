require 'pry'
class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?, :group_name, :join_group, :group_member?

  private


  def join_group
    current_user.groups << self
  end

    def current_user
        @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end
 
    def current_group
      @current_group ||= Group.find_or_create_by(id: params[:group_id]) if params[:group_id]
    end
    
    def logged_in?
        !!session[:user_id]
    end
  
    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end

    def require_login
      if !logged_in?
        redirect_to login_path, :notice => "Please login first!"
      end
    end    
end