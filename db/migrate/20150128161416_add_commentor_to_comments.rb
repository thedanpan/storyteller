class AddCommentorToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentor_id, :integer
  end
end
