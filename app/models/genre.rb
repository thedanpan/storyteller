class Genre < ActiveRecord::Base
  has_many :stories

  validates :name, presence: true, uniqueness: true
end
