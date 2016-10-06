require "rails_helper"

RSpec.describe "Routing to ingredients", :type => :routing do

  it "routes POST /ingredients to ingredients#create" do
    expect(:post => "/recipes/1/ingredients").to route_to("ingredients#create", recipe_id: '1')
  end

end
