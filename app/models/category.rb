class Category < ActiveRecord::Base
  has_many :recipe
end

