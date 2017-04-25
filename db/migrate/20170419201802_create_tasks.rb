class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :estimate
      t.integer :completed
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
