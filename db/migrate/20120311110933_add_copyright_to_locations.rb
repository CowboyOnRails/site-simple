class AddCopyrightToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :copyright, :string
  end
end
