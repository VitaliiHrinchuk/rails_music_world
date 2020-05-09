class Admin::ComposersController < ApplicationController
  layout 'admin'
  before_action :authorized_admin

  def index
    @composers = Composer.all.select('id, name')
    @data = @composers.map(&:attributes)
  end
  
  def new
    @composer = Composer.new
  end

  def create
  
    data = params.permit(:name, :date_of_birth, :date_of_death, :description)
    if params[:avatar].present?
      file = params[:avatar]
      data[:avatar] = file.original_filename
      File.open(Rails.root.join('app','assets', 'images', 'composers', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
    end
    @composer = Composer.create(data)
    if @composer.valid?
      @composer.save
      redirect_to admin_composers_path
    else
      render :new
    end
  end

  def edit 
    @composer = Composer.find(params[:id])
  end

  def update
    data = params.permit(:name, :date_of_birth, :date_of_death, :description)
    if params[:avatar].present?
      file = params[:avatar]
      data[:avatar] = file.original_filename
      File.open(Rails.root.join('app','assets', 'images', 'composers', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
    end
    @composer = Composer.find(params[:id])
    @composer.update(data) 
    redirect_to admin_composers_path
  end

  def destroy
    Composer.find(params[:id]).destroy
    redirect_to admin_composers_path
  end
end
