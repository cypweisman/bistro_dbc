class Menu < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  belongs_to :user
  has_many :recipes, through: :menu_items, source: :recipe

  validates :title, :description, :user_id, presence: true
end
