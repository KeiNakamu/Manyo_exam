class AddColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :deadline, :string, null: false, default: 1
  end
end
