class Story < ActiveRecord::Base
  belongs_to :genre
  belongs_to :author, class_name: "User"

  validates :title, presence: true, uniqueness: true
end
