class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.text :title
      t.boolean :complete
      t.timestamps null: false
    end
  end
end
