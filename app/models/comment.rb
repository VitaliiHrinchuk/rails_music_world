class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :post
  belongs_to :user

  def Comment.get_comments(id)
    Comment.left_joins(:post).left_joins(:user).select('users.name AS author, text, comments.created_at ').where(post_id: id)
  end
  def Comment.get_all_comments
    Comment.left_joins(:post).left_joins(:user).select('users.id AS author_id, posts.id AS post_id, comments.id AS comment_id ,users.name AS author, text, comments.created_at ')
  end
  def Comment.get_count(id)
    Comment.left_joins(:post).left_joins(:user).where(post_id: id).count
  end
end
