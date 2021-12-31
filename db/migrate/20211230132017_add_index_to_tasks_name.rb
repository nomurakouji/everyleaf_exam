class AddIndexToTasksName < ActiveRecord::Migration[6.0]
  def change
    add_index :tasks, [:name, :content, :deadline, :condition]
  end
end
