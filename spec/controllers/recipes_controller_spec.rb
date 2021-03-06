require "rails_helper"

describe RecipesController do

  describe "GET #index" do
  let!(:recipe) { Recipe.create(name: "Cake", description: "tasty cake", prep_time: "30 min", directions: "put it in oven", user_id: 1, category_id: 1)}
    it 'responds with a status code 200' do
      get :index
      expect(response).to have_http_status 200
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      user = User.create!(username: "Ryan", password: "12341234", email: "Ryan@ryan.com")
      get :new, { user_id: user.id }
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'when valid params are passed' do

      it "assigns the newly created recipe as @recipe" do
        user = User.create!(username: "Ryan", password: "12341234", email: "RyB@ryan.com")
        post :create, { user_id: user.id, recipe: {name: "Brownie Cake", description: "The chef's finest", directions: "Do this \n do this\n", prep_time: 25, category_id: 1, user_id: user.id} }
        new_recipe = Recipe.last

        expect(assigns(:recipe)).to eq new_recipe
      end

      it "redirects to the users show page" do
        user = User.create!(username: "Ryan", password: "12341234", email: "RyB@ryan.com")
        post :create, { user_id: user.id, recipe: {name: "Brownie Cake", description: "The chef's finest", directions: "Do this \n do this\n", prep_time: 25, category_id: 1, user_id: user.id} }
        new_recipe = Recipe.last

        expect(response).to redirect_to "/users/#{user.id}"
      end
    end

  end

  describe "POST #create" do
    context 'when invalid params are passed' do

      it "renders to the new recipe template" do
        user = User.create!(username: "Ryan", password: "12341234", email: "RyB@ryan.com")
        post :create, { user_id: user.id, recipe: {name: "Brownie Cake", description: "The chef's finest", directions: "Do this \n do this\n", prep_time: 25, category_id: 1, user_id: nil} }

        expect(response).to render_template(:new)
      end
    end

  end
end
