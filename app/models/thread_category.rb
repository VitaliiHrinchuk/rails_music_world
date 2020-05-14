class ThreadCategory < ApplicationRecord
  self.table_name = 'thread_category'
  has_many :topics
  validates :name, presence: true
end
