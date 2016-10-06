require "rails_helper"

feature 'registering for the site' do
  scenario "the user clicks on create and is registered" do
    visit '/users/new'
    old_count = User.all.count
    within_fieldset("Register") do
      fill_in 'username', :with => "Jack"
    end

    within_fieldset("Register") do
      fill_in 'email', :with => "unique@example.com"
    end

    within_fieldset("Register") do
      fill_in 'password', :with => "password_plus_1"
    end

    click_button('Create')

    expect(User.all.count).to eq(old_count + 1)
  end
end
