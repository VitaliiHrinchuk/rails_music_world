class Message < ApplicationRecord
  self.table_name = 'thread_messages'
  validates :message, presence: true
  belongs_to :topic, class_name: 'Topic', foreign_key: 'thread_id'
  belongs_to :user

  def Message.get_with_join(id)
    Message.left_joins(:topic).left_joins(:user).select('users.name AS author, message, thread_messages.created_at ').where(thread_id: id)
  end
end
