class UpdateColumnForPrayers < ActiveRecord::Migration
  def up
    change_column :prayers, :description, :text, null: false
    change_column :comments, :description, :text, null: false
  end

  def down
    change_column :prayers, :description, :string, null: false
    change_column :comments, :description, :string, null: false
  end
end
