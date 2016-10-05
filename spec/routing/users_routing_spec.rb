require "rails_helper"

RSpec.describe "Routing to users", :type => :routing do
  it "routes GET /users/new to users#new" do
    expect(:get => '/users/new').to route_to ("users#new")
  end
end
