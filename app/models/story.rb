class Story < ActiveRecord::Base
  belongs_to :genre
  belongs_to :author, class_name: "User"

  has_many :comments, class_name: "Comment", foreign_key: :story_id

  validates :title, presence: true, uniqueness: true

  def date_published
    created_at.strftime("%D")
  end
end
