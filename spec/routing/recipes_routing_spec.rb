require "rails_helper"

RSpec.describe "Routing to recipes", :type => :routing do
  it "routes GET /recipes to recipes#index" do
    expect(:get => "/recipes").to route_to("recipes#index")
  end

   it "routes GET /recipes/1 to recipes#show" do
    expect(:get => "/recipes/1").to route_to("recipes#show", :id => "1")
  end



end
