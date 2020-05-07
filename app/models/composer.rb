class Composer < ApplicationRecord
  self.table_name = 'composers'
  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates :description, presence: true

end
