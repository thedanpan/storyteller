class Story < ActiveRecord::Base
  belongs_to :genre
  belongs_to :author, class_name: "User"

  validates :title, presence: true, uniqueness: true

  def date_published
    self.created_at.strftime("%D")
  end
end
