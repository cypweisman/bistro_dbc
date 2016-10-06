class ChangeAmountColumnToStringOnIngredients < ActiveRecord::Migration
  def change
    change_column :ingredients, :amount, :string
  end
end
