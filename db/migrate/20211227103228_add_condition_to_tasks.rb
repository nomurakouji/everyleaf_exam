class AddConditionToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :condition, :string
  end
end
