# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

t_description = ["tasty dish", "simple snack", "some thing"]
t_prep_time = [30, 60, 120]
t_directions = ["bake in oven", "chop up, put in bowl, serve", "wrap, put in fridge"]
t_categories = ["breakfast", "lunch", "dinner", "appetizer", "dessert"]
t_names = ["Tamales", "Christmas Cake", "Chicken Blah Blah", "Fruit Brulee", "Nuts Mix", "Beef Stew", "Some Salad", "Exciting DOnuts", "Corn mix", "Vegan dish"]
t_ingredients = ["corn," "flour", "beef", "water", "butter"]

t_categories.each do |t_category|
  Category.create!(title: t_category)
end
# pete = User.create(username: "Chef Pete", email: "pete@gmail.com", password: "password1", is_admin: true)
# pete.is_admin = true
# pete.save
5.times do
   User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

t_names.each do |t_name|
  Recipe.create!(name: t_name, description: t_description.sample, prep_time: t_prep_time.sample, directions: t_directions.sample, user_id: rand(1..5), category_id: rand(1..5))
end

20.times do
  Ingredient.create!(name: t_ingredients.sample, amount: "1 tsp", recipe_id: rand(1..10))
end


