require 'rails_helper'

describe RecipesController do
  let!(:recipe) { Recipe.create(name: "Cake", description: "tasty cake", prep_time: "30 min", directions: "put it in oven", user_id: 1, category_id: 1)}
  describe "GET #index" do
    it 'responds with a status code 200' do
      get :index
      expect(response).to have_http_status 200
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end




end

