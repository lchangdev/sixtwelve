class CreateMemberRequests < ActiveRecord::Migration
  def change
    create_table :member_requests do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :accepted, default: false
      t.timestamps
    end
  end
end
