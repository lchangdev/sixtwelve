class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description, null: false
      t.integer :prayer_id, null: false
      t.integer :user_id
      # need to include user_id null false
      t.timestamps
    end
  end
end
