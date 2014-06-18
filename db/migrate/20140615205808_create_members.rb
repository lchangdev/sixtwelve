class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :group_id
    end

  add_index :members, [:user_id, :group_id], unique: true
  end
end
