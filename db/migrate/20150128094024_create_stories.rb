class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :author
      t.references :genre

      t.string :title
      t.text :content
      t.boolean :fiction

      t.timestamps null: true
    end
  end
end
