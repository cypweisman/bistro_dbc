require "rails_helper"

RSpec.describe "Routing to recipes", :type => :routing do
  it "routes GET /recipes to recipes#index" do
    expect(:get => "/recipes").to route_to("recipes#index")
  end


end
