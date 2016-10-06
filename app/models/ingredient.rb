class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :name, presence: true
  validates :amount, presence: true
  validates :recipe_id, presence: true

end
