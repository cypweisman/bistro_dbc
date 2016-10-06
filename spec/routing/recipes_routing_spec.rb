require "rails_helper"

RSpec.describe "Routing to recipes", :type => :routing do

  it "routes GET /recipes/new to recipes#new" do
    expect(:get => "/recipes/new").to route_to("recipes#new")
  end

  it "routes POST /users/:id/recipes to recipes#create" do
    expect(:post => "/users/:id/sessions").to route_to("recipes#create")
  end

end
