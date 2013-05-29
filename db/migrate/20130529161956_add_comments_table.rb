class AddCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :author_id
      t.integer :parent_link_id
    end
  end
end
