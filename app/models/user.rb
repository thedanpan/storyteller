class User < ActiveRecord::Base
  has_secure_password

  has_many :stories, class_name: "Story", foreign_key: :author_id

  validates :email, :presence => {:message => "Must provide an email"}
  validates :email, :uniqueness => {:message => "Sorry, that email is already taken"}
end
