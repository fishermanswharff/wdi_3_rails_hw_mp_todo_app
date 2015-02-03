class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :label
      t.boolean :complete
      t.references :list, index: true
      t.timestamps, null: false
    end
    add_foreign_key :tasks, :lists
  end
end
