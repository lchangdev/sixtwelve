class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.timestamps
    end
    add_index :lists, :title, unique: true
  end
end
