class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :name, presence: true
  validates :amount, presence: true
  validates :recipe_id, presence: true

  def self.ingredient_search(criteria)
    plug_ingredients = self.where("name LIKE ?", "%#{criteria}%")
    ingredients_recipes = []
    plug_ingredients.each do |ingredient|
        ingredients_recipes << ingredient.recipe
      end
    ingredients_recipes
  end



end
