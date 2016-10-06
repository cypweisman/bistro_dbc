require "rails_helper"

describe Ingredient do

  describe "attributes" do
  let(:ingredient) { Ingredient.create!(name: "onion", amount: "1.5 cups", recipe_id: 1) }
    it "has an ingredient name" do
      expect(ingredient.name).to eq("onion")
    end

    it "has an amount" do
      expect(ingredient.amount).to eq("1.5 cups")
    end

    it "has a recipe_id" do
      expect(ingredient.recipe_id).to eq (1)
    end

  end

  describe "validations" do
    it "is invalid without an ingredient name" do
      Ingredient.create(amount: "1.5 cups", recipe_id: 1)
      expect(Ingredient.count).to eq(0)
    end

    it "is invalid without an amount" do
      Ingredient.create(name: "onion", recipe_id: 1)
      expect(Ingredient.count).to eq(0)
    end

  end
end

