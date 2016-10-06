require "rails_helper"

RSpec.describe "Routing for menus", :type => :routing do

  it "routes GET /users/1/menus/new to menues#new" do
    expect(:get => "/users/1/menus/new").to route_to("menus#new", user_id: "1")
  end


end
