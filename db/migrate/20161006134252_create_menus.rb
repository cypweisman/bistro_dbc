class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps(null: false)
    end
  end
end
