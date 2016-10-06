require 'rails_helper'

describe MenusController do
  let!(:menu) { Menu.create!(title: "Brunch", description: "A fine fair of light early morning options", user_id: 1) }

  describe "GET #new" do
   it "renders the :new template" do
    user = User.create!(username: "jack_r", email: "test@yahoo.com", password: "password")
    get :new, { user_id: user.id}
    expect(response).to render_template(:new)
  end
  end
end
