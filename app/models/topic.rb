class Topic < ApplicationRecord
  self.table_name = 'threads'
  has_many :messages
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user

  def Topic.get_with_join(id)
    Topic.left_joins(:user).select("users.id as user_id, users.name AS 'author', title, description, threads.created_at, threads.id AS id").find(id)
  end
end
