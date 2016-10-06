class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.float :price, null: false
      t.text :description, null: false
      t.integer :menu_id, null: false
      t.integer :recipe_id, null: false

      t.timestamps(null: false)
    end
  end
end
