class AuthController < ApplicationController

  def login
    @user = User.new
  end
  
  def signin
    
    @user = User.find_by(email: params[:email])
    if !@user
      @error = "Не знайдено користувача із такого електронною поштою"
      return render :login
    end
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @error = "Невірний пароль"
      render :login
    end
  end

  def signup 
    @user = User.new
  end


  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to '/'
    else 
      render :signup
    end
  end

  def user_params
    params.permit(:email, :password, :name)
  end


  def logout
    session[:user_id] = nil
    redirect_to '/auth/login'
  end

end
