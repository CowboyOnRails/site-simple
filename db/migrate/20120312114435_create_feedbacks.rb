class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.string :title
      t.text :message
      t.string :antispam

      t.timestamps
    end
  end
end
