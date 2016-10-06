require "rails_helper"

describe Recipe do

  describe "attributes" do

  let(:recipe) { Recipe.create!(name: "Brownie Pie Cake", description: "Mom's homemade brownies with nice nuts in them", prep_time: 45, directions: "Start by doing this \n and then do this \n and then do this\n", user_id: 1, category_id: 1) }

    it "has a name" do
      expect(recipe.name).to eq("Brownie Pie Cake")
    end

    it "has a description" do
      expect(recipe.description).to eq("Mom's homemade brownies with nice nuts in them")
    end

    it "has a prep time" do
      expect(recipe.prep_time).to eq (45)
    end

    it "has directions" do
      expect(recipe.directions).to eq "Start by doing this \n and then do this \n and then do this\n"
    end

  end

  describe "validations" do
    it "is invalid without a name" do
      Recipe.create(description: "Mom's homemade brownies with nice nuts in them", prep_time: 45, directions: "Start by doing this \n and then do this \n and then do this\n", user_id: 1, category_id: 1)
      expect(Recipe.count).to eq(0)
    end

    it "is invalid without a description" do
      Recipe.create(name: "Brownie Pie Cake", prep_time: 45, directions: "Start by doing this \n and then do this \n and then do this\n", user_id: 1, category_id: 1)
      expect(Recipe.count).to eq(0)
    end

    it "is invalid without a prep time" do
      Recipe.create(name: "Brownie Pie Cake", description: "Mom's homemade brownies with nice nuts in them", directions: "Start by doing this \n and then do this \n and then do this\n", user_id: 1, category_id: 1)
      expect(Recipe.count).to eq (0)
    end

    it "is invalid if prep time is negative" do
      Recipe.create(name: "Brownie Pie Cake", description: "Mom's homemade brownies with nice nuts in them", prep_time: (-10), directions: "Start by doing this \n and then do this \n and then do this\n", user_id: 1, category_id: 1)
      expect(Recipe.count).to eq (0)
    end

    it "is invalid without directions" do
      Recipe.create(name: "Brownie Pie Cake", description: "Mom's homemade brownies with nice nuts in them", prep_time: (-10),user_id: 1, category_id: 1)
      expect(Recipe.count).to eq (0)
    end
  end
end
