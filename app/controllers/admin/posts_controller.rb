class Admin::PostsController < ApplicationController
  layout 'admin'

  def index
    @posts = Post.all.select('id, theme, created_at').order(created_at: :desc)
    @data = @posts.map(&:attributes)
  end

  def new
    @post = Post.new
  end

  def create
    
    data = params.permit(:content, :theme)
    if params[:bg_img].present?
      file = params[:bg_img]
      data[:bg_img] = file.original_filename
      File.open(Rails.root.join('app','assets', 'images', 'posts', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
    end
    
    @post = Post.create(data)
    if @post.valid?
      @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit 
    @post = Post.find(params[:id])
 
  end

  def update
    data = params.permit(:content, :theme)
    if params[:bg_img].present?
      file = params[:bg_img]
      data[:bg_img] = file.original_filename
      File.open(Rails.root.join('app','assets', 'images', 'posts', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
    end
    @post = Post.find(params[:id])
    @post.update(data)
    redirect_to admin_posts_path
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path
  end

end
