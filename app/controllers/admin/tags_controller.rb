class Admin::TagsController < ApplicationController
  layout 'admin'
  before_action :authorized_admin
  def index
    @tags = Tag.all.select('id, name').order(created_at: :desc)
    @data = @tags.map(&:attributes)
  end
  
  def new
    @tag = Tag.new
  end

  def create
    
    data = params.permit(:name)

    
    @tag = Tag.create(data)
    if @tag.valid?
      @tag.save
      redirect_to admin_tags_path
    else
      render :new
    end
  end

  def edit 
    @tag = Tag.find(params[:id])
  end

  def update
    data = params.permit(:name)

    @tag = Tag.find(params[:id])
    @tag.update(data)

    redirect_to admin_tags_path
  end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to admin_tags_path
  end
end
