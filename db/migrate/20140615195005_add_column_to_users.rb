class AddColumnToUsers < ActiveRecord::Migration
  def up
    add_column :users, :group_id, :integer
    # after deleting database need to include null false
  end

  def down
    remove_column :users, :group_id
  end
end
