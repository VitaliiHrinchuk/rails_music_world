class Admin::CommentsController < ApplicationController

  layout 'admin'
  before_action :authorized_admin
  def index
    @comments = Comment.get_all_comments
    @data = @comments.map(&:attributes)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_comments_path
  end
end
