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

  describe "POST #create" do
    context "valid params are passed" do

      it "assigns the newly created menu as @menu" do
        user = User.create!(username: "Ryan", password: "12341234", email: "test@ryan.com")
        post :create, { user_id: user.id, menu: {title: "Brunch", description: "A fine fair of light early morning options", user_id: 1}}
        new_menu = Menu.last
        expect(assigns(:menu)).to eq new_menu
      end

      it "redirects to the menu show" do
        user = User.create!(username: "Ryan", password: "12341234", email: "test@ryan.com")
        post :create, { user_id: user.id, menu: {title: "Brunch", description: "A fine fair of light early morning options", user_id: 1}}
        new_menu = Menu.last

        expect(response).to redirect_to "/menus/#{new_menu.id}"
      end
    end

    context "when invalid params are passed" do

      it "renders the new menu template" do
        user = User.create!(username: "Ryan", password: "12341234", email: "test@ryan.com")
        post :create, { user_id: user.id, menu: {title: "Brunch", description: "A fine fair of light early morning options", user_id: nil}}

        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do

    it "renders the show template" do
      menu = Menu.create!(title: "Lovely", description: "Lovely", user_id: 1)
      get :show, { id: menu.id }
      expect(response).to render_template(:show)
    end
  end
end
