class Post < ApplicationRecord
  self.table_name = 'posts'
  has_many :post_tags
  has_many :comments
  has_many :tags, :through => :post_tags
  validates :theme, presence: true
  validates :content, presence: true
  validates :bg_img, presence: true


  


end
