
require "rails_helper"

describe Menu do

  describe "attributes" do
  let(:menu) { Menu.create!(title: "Brunch", description: "A fine fair of light early morning options", user_id: 1) }

    it "has a title" do
      expect(menu.title).to eq("Brunch")
    end

    it "has an description" do
      expect(menu.description).to eq("A fine fair of light early morning options")
    end

    it "has a user_id" do
      expect(menu.user_id).to eq(1)
    end
  end

  describe "validations" do
    it "is invalid without a title" do
      Menu.create(description: "So Great!", user_id: 1)
      expect(Menu.count).to eq(0)
    end

    it "is invalid without a description" do
      Menu.create(title: "Brunch", user_id: 1)
      expect(Menu.count).to eq(0)
    end

    it "is invalid without a user id" do
      Menu.create(title: "Brunch", description: "So Great!")
      expect(Menu.count).to eq (0)
    end
  end
end

