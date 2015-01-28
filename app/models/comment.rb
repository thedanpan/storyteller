class Comment < ActiveRecord::Base
  belongs_to :story, class_name: "Story"

  validates :content, presence: true

  def date_posted
    created_at.strftime("%D")
  end
end
