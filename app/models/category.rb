class Category < ActiveRecord::Base
  has_many :recipe

  validates :title, uniqueness: true
end

