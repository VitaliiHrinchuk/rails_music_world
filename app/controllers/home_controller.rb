class HomeController < ApplicationController
  def index
    @posts = Post.all.select('id, theme, created_at, bg_img, content').limit(4).order(created_at: :desc)
    @latest_posts = @posts.map(&:attributes)
 
 
    @latest_posts.each do |post|
      post['comments'] = Comment.get_count(post['id'])
      post['tags'] = PostTag.get_with_join(post['id']).map(&:attributes)
    end
  end
end
