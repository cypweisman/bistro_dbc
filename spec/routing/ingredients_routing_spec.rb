require "rails_helper"

RSpec.describe "Routing to ingredients", :type => :routing do

  it "routes POST /ingredients to ingredients#create" do
    expect(:post => "/recipes/:id/ingredients").to route_to("ingredients#create")
  end

end
