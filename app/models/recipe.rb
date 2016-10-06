class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :categories
end
