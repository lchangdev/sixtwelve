class RemoveUniqueFromPrayers < ActiveRecord::Migration
  def up
    remove_index :prayers, :title
  end

  def down
    add_index :prayers, :title, unique: true
  end
end
