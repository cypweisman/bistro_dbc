class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :prep_time, null: false
      t.text :directions, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false

      t.timestamps(null: false)
    end
  end
end
