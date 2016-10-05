require "rails_helper"

describe User  do
  let(:user) { User.create!(username: "jack_noble", email: "jack@yahoo.com", password: "password") }

  describe "attributes" do
    it "has a username" do
      expect(user.username).to eq("jack_noble")
    end

    it "has an email" do
      expect(user.email).to eq("jack@yahoo.com")
    end

    it "has a hashed password" do
      expect(user.password_digest).to_not be user.password
    end

    it "has an admin status of false upon creation" do
      expect(user.is_admin).to eq false
    end
  end
end
