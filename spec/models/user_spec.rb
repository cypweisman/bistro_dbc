require "rails_helper"

describe User  do

  describe "attributes" do
  let(:user) { User.create!(username: "jack_noble", email: "jack@yahoo.com", password: "password") }

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

  describe "validations" do
    it "is invalid without a username" do
      User.create(email: "jack@yahoo.com", password: "password")
      expect(User.count).to eq(0)
    end

    it "is invalid without an email" do
      User.create(username: "jack_noble", password: "password")
      expect(User.count).to eq(0)
    end

    it "requires a password of at least 8 characters" do
      User.create(username: "jack_noble", email: "jack@yahoo.com", password: "passwor")
      expect(User.count).to eq (0)
    end

    it "requires emails to be unique" do
      User.create(username: "ryan_howard", email: "jack@yahoo.com", password: "12341234")
      User.create(username: "jack_noble", email: "jack@yahoo.com", password: "password")
      expect(User.count).to eq(1)
    end
  end

  # describe "associations" do
  #   it "has a collection of recipes" do
  #     user = User.create!(username: "jack_noble", email: "jack@yahoo.com", password: "password")
  #     Category.create!(title: "dessert")
  #     Recipe.create!(name: "Creme Brule", description: "A fine velvety dessert cake", prep_time: 30, directions: "1. prepare, 2. cook", user_id: user.id, category_id: 1)
  #     expect(user.recipes.length).to eq(1)
  #   end
  # end
end
