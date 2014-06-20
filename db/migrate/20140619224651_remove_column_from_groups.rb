class RemoveColumnFromGroups < ActiveRecord::Migration
  def up
    remove_column :groups, :security_question
    remove_column :groups, :security_answer
  end

  def down
    add_column :groups, :security_question, :string, null: false
    add_column :groups, :security_answer, :string, null: false
  end
end
