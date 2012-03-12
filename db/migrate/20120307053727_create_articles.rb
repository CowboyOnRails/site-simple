class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :slug
      t.text :body
      t.integer :position, :default => 1
      t.boolean :home, :default => false
      t.integer :parent_id, :default => 0
      t.integer :metaitem_id

      t.timestamps
    end
    add_index :articles, :parent_id
    add_index :articles, :metaitem_id
    add_index :articles, :position
    add_index :articles, :slug
    add_index :articles, :home
  end
end
