class ApplicationController < ActionController::Base
  I18n.locale = :ua
  helper_method :logged_in?, :current_user, :is_admin?
  
  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end


  def is_admin?
    !!current_user && current_user['is_admin']
  end
  
  def logged_in?
    !!current_user
  end

 

  def authorized
    redirect_to '/auth/login' unless logged_in?
  end

  def authorized_admin
    redirect_to '/admin/auth' unless is_admin?
  end
end
