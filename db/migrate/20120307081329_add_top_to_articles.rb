class AddTopToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :top, :boolean, :default => false
    add_index :articles, :top
  end
end
