class Recipe < ActiveRecord::Base
  has_many :ingredients
  belongs_to :user
  belongs_to :category
  has_many :menu_items
  has_many :menus, through: :menu_items, source: :menu

  validates :name, :description, :prep_time, :directions, :user_id, presence: true

  validates :prep_time, numericality: { greater_than: 0 }

  def self.recipe_search(criteria)
    recipes = self.where("name LIKE ?", "%#{criteria}%")
  end

  def self.recipe_menu_search(criteria, user)
    menus = []
     recipes = Recipe.where('name LIKE ?', "%#{criteria}%")
     recipes.each do |recipe|
       recipe.menus.each do |menu|
          if menu.user.id == user.id
          menus << menu
          end
       end
     end
     menus
  end

end
