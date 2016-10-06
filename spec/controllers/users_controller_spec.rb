require "rails_helper"

describe UsersController do
  let!(:user) { User.create!(username: "jack_r", email: "test@yahoo.com", password: "password")}

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'when valid params are passed' do

      it "assigns the newly created user as @user" do
        post :create, { user: {username: "jack_noble", password: "password", email: "jack@email.com"} }
        new_user = User.last

        expect(assigns(:user)).to eq new_user
      end

      it "redirects to the users show page" do
        post :create, { user: {username: "jack_noble", password: "password", email: "jack@email.com"} }
        new_user = User.last

        expect(response).to redirect_to "/users/#{new_user.id}"
      end
    end
  end

  describe "GET #show" do
    context "when a contributor" do

      it "assigns the correct user as @user" do
        get :show, { id: user.id }
        expect(assigns(:user)).to eq(user)
      end

      it "renders the :show template" do
        get :show, { id: user.id}
        expect(response).to render_template(:show)
      end

    end
  end
end
