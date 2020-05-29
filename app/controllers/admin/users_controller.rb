class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authorized_admin
  def index
    @users = User.all.select('id, name, email, is_admin').order(created_at: :desc)
    @data = @users.map(&:attributes)
  end

  def update
    data =  params.permit(:is_admin)
  
    @user = User.find(params[:id])
    @user.update(data)
    puts "error"
    puts @user.errors.full_messages
    redirect_to admin_users_path
  end
end
