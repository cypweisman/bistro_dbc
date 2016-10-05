require 'rails_helper'

describe SessionsController do
  let!(:user) { User.create(username: "Lucas", email: "lucas@test.com", password: "money", is_admin: true)}
  describe "GET #new" do
    it 'responds with a status code 200' do
      get :new
      expect(response).to have_http_status 200
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

   describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 200" do
        post :create, { session: {user_id: "1"}}
        expect(response).to have_http_status 200
      end

      # it "sets a notice that the game was successfully created" do
      #   post :create, { game: {user_throw: "paper", computer_throw: "rock"}}

      #   expect(flash[:notice]).to eq "Game was successfully created."
      # end

      # it "redirects to the user show" do
      #   post :create, { session: {user_id: "1"}}
      #   new_session = 1

      #   expect(response).to redirect_to "/users/#{new_session}"
      # end
    end
  end

end
