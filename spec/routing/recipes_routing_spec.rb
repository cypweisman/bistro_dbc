require "rails_helper"

RSpec.describe "Routing to recipes", :type => :routing do

  it "routes GET /recipes to recipes#index" do
    expect(:get => "/recipes").to route_to("recipes#index")
  end

   it "routes GET /recipes/1 to recipes#show" do
    expect(:get => "/recipes/1").to route_to("recipes#show", :id => "1")
  end

  it "routes GET /users/1/recipes/new to recipes#new" do
    expect(:get => "/users/1/recipes/new").to route_to("recipes#new", :user_id => '1')
  end

  it "routes POST /users/:user_id/recipes to recipes#create" do
    expect(:post => "/users/1/recipes").to route_to("recipes#create", :user_id => '1')
  end

end
