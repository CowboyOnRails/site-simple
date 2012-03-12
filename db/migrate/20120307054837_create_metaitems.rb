class CreateMetaitems < ActiveRecord::Migration
  def change
    create_table :metaitems do |t|
      t.string :title
      t.text :description
      t.text :keywords
      t.references :article

      t.timestamps
    end
    add_index :metaitems, :article_id
  end
end
