class PostsController < ApplicationController
  def index
    @posts = Post.all.select('id, theme, created_at, bg_img, content').order(created_at: :desc)
    @data = @posts.map(&:attributes)
    @data.each do |post|
      post['comments'] = Comment.get_count(post['id'])
    end
  end

  def read
    @post = Post.find(params[:id])
    @comments = Comment.get_comments(params[:id]).map(&:attributes)
  end
end
