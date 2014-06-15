class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :security_question, null: false
      t.string :security_answer, null: false
    end
  end
end
