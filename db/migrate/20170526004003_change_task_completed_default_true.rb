class ChangeTaskCompletedDefaultTrue < ActiveRecord::Migration[5.0]
  def change
    change_column(:tasks, :completed, :int, default: 0)
  end
end
