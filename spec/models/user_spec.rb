require "rails_helper"

describe User  do
  let(:user) { User.create!(username: "jack_noble", email: "jack@yahoo.com", password: "password", is_admin: false) }

  describe "attributes" do
    it "has a username" do
      expect(user.username).to eq("jack_noble")
    end

    it "has an email" do
      expect(user.email).to eq("jack@yahoo.com")
    end
  end
end
