class Recipe < ActiveRecord::Base
  has_many :ingredients
  belongs_to :user
  belongs_to :category

  validates :name, :description, :prep_time, :directions, :user_id, presence: true

end
