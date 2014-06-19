class UpdateUserColumn < ActiveRecord::Migration
  def ups
    change_column :users, :image, :string, image_size: 'large'
  end

  def down
    change_column :users, :image, :string, image_size: 'square'
  end
end
