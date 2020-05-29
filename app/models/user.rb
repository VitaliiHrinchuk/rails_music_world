class User < ApplicationRecord
  self.table_name = 'users'
  has_secure_password
  validates :name, presence: true, on: :create
  validates :email, presence: true, uniqueness: true, on: :create
  validates :password, presence: true, on: :create

  has_many :topics
  has_many :comments
end
