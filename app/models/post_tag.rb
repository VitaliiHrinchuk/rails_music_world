class PostTag < ApplicationRecord
  self.table_name = 'posts_tags'
  belongs_to :post
  belongs_to :tag
  def PostTag.get_with_join(id)
    PostTag.left_joins(:post).left_joins(:tag).select('tags.name as tag_name, tags.id as tag_id').where(post_id: id)
  end
end
