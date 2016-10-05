require 'rails_helper'

feature "visiting the login" do
  scenario "the user sees a login form and submits" do
    # Create a most recent game that should definitely appear in the list
    user = User.create(username: "Lucas", email: "lucas@test.com", password: "money", is_admin: true)

    visit "/sessions/new"

    within_fieldset("Login") do
      fill_in 'email', :with => "jack.carmco@yahoo.com"
    end

    within_fieldset("Login") do
      fill_in 'password', :with => "password"
    end

    click_button('Submit')

    visit "/users/#{user.id}"
    expect(page).to have_content "logout"
  end

end
