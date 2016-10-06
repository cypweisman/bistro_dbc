require "rails_helper"

describe RecipesController do

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'when valid params are passed' do

      it "assigns the newly created recipe as @recipe" do
        post :create, { recipe: {name: "Brownie Cake", description: "The chef's finest", user_id: 1} }
        new_recipe = Recipe.last

        expect(assigns(:recipe)).to eq new_recipe
      end

      it "redirects to the users show page" do
        post :create, { recipe: {name: "Brownie Cake", description: "The chef's finest", user_id: 1} }
        new_recipe = Recipe.last

        expect(response).to redirect_to "/recipes/#{new_recipe.id}"
      end
    end

  end

  describe "POST #create" do
    context 'when invalid params are passed' do

      it "renders to the users show page" do
        post :create, { recipe: { description: "The chef's finest", user_id: 1} }

        expect(response).to render :new
      end
    end

  end
end
