class AddColumnToPrayers < ActiveRecord::Migration
  def up
    add_column :prayers, :group_id, :integer
  end

  def end
    remove_column :prayers, :group_id
  end
end
