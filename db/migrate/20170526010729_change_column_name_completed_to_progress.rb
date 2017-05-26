class ChangeColumnNameCompletedToProgress < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :completed, :progress
  end
end
