class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :user_id
      # need to make user_id null false
      t.timestamps
    end
    add_index :prayers, :title, unique: true
  end
end
