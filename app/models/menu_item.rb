class MenuItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :recipe

  validates :price, :description, :menu_id, :recipe_id, presence: true
end
