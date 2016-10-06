require "rails_helper"

describe MenuItem  do

  describe "attributes" do
  let(:menu_item) { MenuItem.create!(price: 3000, description: "awesome dish", menu_id: 1, recipe_id: 2) }

    it "has a price" do
      expect(menu_item.price).to eq(3000)
    end

    it "has a description" do
      expect(menu_item.description).to eq("awesome dish")
    end

    it "has a menu id" do
      expect(menu_item.recipe_id).to eq(2)
    end

    it "has a recipe id" do
      expect(menu_item.menu_id).to eq(1)
    end
  end

  describe "validations" do
    it "is invalid without a price" do
      old_count = MenuItem.all.count
      MenuItem.create(price: nil, description: "awesome dish", menu_id: 1, recipe_id: 2)
      expect(MenuItem.all.count).to eq(old_count)
    end

    it "is invalid without a description" do
      old_count = MenuItem.all.count
      MenuItem.create(price: 1300, description: nil, menu_id: 1, recipe_id: 2)
      expect(MenuItem.all.count).to eq(old_count)
    end



  end


end

