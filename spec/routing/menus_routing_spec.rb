require "rails_helper"

RSpec.describe "Routing for menus", :type => :routing do

  it "routes GET /users/1/menus/new to menus#new" do
    expect(:get => "/users/1/menus/new").to route_to("menus#new", user_id: '1')
  end

  it "routes POST /users/1/menus to menus#create" do
    expect(:post => "/users/1/menus").to route_to("menus#create", user_id: '1')
  end
end
