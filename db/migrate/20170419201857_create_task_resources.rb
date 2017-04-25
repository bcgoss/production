class CreateTaskResources < ActiveRecord::Migration[5.0]
  def change
    create_table :task_resources do |t|
      t.references :task, foreign_key: true
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
