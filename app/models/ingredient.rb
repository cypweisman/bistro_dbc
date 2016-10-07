class Ingredient < ActiveRecord::Base
  scope :retrieve, -> { where(recipe_id: nil, created_at: DateTime.now - 5.minutes)}
  belongs_to :recipe

  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, length: { minimum: 2 }
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
