class Menu < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  belongs_to :user
  has_many :recipes, through: :menu_items, source: :recipe

  validates :title, :description, :user_id, presence: true


  def sort_menu
    sorted_menu = self.sort_by_category
    temp_array = []
    menu_categories = {}
    current_category = sorted_menu[0].category.title
    sorted_menu.each do |item|
      if item.category.title == current_category
        temp_array << item
      else
        menu_categories[current_category] = temp_array
        temp_array = [item]
        current_category = item.category.title
      end
      menu_categories[current_category] = temp_array
    end
    menu_categories
  end

  def sort_by_category
    sorted_items = self.menu_items.sort_by { |item| item.recipe.category.title}
    sorted_items
  end

end

