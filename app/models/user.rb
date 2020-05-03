class User < ApplicationRecord
  self.table_name = 'users'
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :topics
  has_many :comments
end
