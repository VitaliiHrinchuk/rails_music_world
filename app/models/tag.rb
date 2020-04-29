class Tag < ApplicationRecord
  self.table_name = 'tags'
  has_many :post_tags
  has_many :posts, :through => :post_tags

end
