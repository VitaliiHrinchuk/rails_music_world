class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_action :authorized_admin
  def index
    @categories = ThreadCategory.all.select('id, name').order(created_at: :desc)
    @data = @categories.map(&:attributes)
  end
  
  def new
    @category = ThreadCategory.new
  end

  def create
    
    data = params.permit(:name)

    
    @category = ThreadCategory.create(data)
    if @category.valid?
      @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit 
    @category = ThreadCategory.find(params[:id])
  end

  def update
    data = params.permit(:name)

    @category = ThreadCategory.find(params[:id])
    @category.update(data)

    redirect_to admin_categories_path
  end

  def destroy
    ThreadCategory.find(params[:id]).destroy
    redirect_to admin_categories_path
  end
end
