class Admin::AuthController < ApplicationController
  layout 'admin'

  def index
    @user = User.new
  end
  
  def create
    
    @user = User.find_by(email: params[:email])
    if !@user
      @error = "Не знайдено користувача із такого електронною поштою"
      return render :index
    end
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to admin_posts_path
    else
      @error = "Невірний пароль"
      render :index
    end
  end
end
