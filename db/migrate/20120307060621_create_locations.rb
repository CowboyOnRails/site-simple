class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :phone1
      t.string :phone2
      t.text :adress
      t.string :email
      t.string :sitename

      t.timestamps
    end
  end
end
