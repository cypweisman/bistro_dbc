require 'rails_helper'

feature "visiting the login" do
  scenario "the user sees a login form and submits" do
    # Create a most recent game that should definitely appear in the list
    user = User.create(username: "Lucas", email: "lucas@test.com", password: "money333333", is_admin: true)

    visit "/sessions/new"

    within_fieldset("Login") do
      fill_in 'email', :with => "lucas@test.com"
    end

    within_fieldset("Login") do
      fill_in 'password', :with => "money333333"
    end

    click_button('Submit')

    expect(page.current_path).to eq user_path(user)
    expect(page).to have_content "logout"
  end

end
