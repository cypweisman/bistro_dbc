class MenuItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :recipe
  has_one :category, through: :recipe
  validates :description, :menu_id, :recipe_id, presence: true

  validates :price, presence: true
end
