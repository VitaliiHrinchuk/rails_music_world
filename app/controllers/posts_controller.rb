class PostsController < ApplicationController
  POSTS_PER_PAGE = 2

  def index
    @page = params.fetch(:page, 0).to_i
    @posts = Post.all.select('id, theme, created_at, bg_img, content').offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE).order(created_at: :desc)
    @total = Post.count
    @pages_count = @total / POSTS_PER_PAGE
 
    @data = @posts.map(&:attributes)
    @data.each do |post|
      post['comments'] = Comment.get_count(post['id'])
      post['tags'] = PostTag.get_with_join(post['id']).map(&:attributes)
    end
  end

  def read
    @post = Post.find(params[:id])
    @comments = Comment.get_comments(params[:id]).map(&:attributes)
  end

  def comment
    comment = params.permit(:text)
    comment[:user_id] = session[:user_id]
    comment[:post_id] = params[:id]
    @comment = Comment.create(comment)
    if @comment.valid?
      @comment.save
      redirect_back(fallback_location: '/')
    else 
      flash[:error] = @comment.errors.full_messages
      redirect_back(fallback_location: '/')
    end
  end
end
