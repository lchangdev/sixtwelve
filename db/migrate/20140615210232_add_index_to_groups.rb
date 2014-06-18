class AddIndexToGroups < ActiveRecord::Migration
  def up
    add_index :groups, :name, unique: true
  end

  def down
    remove_index :groups, :name
  end
end
