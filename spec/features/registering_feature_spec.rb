require "rails_helper"

feature 'registering for the site' do
  scenario "the user clicks on register and is registered" do
    visit '/users/new'
    within_fieldset("Register") do
      fill_in 'username', :with => "Jack"
    end

    within_fieldset("Register") do
      fill_in 'email', :with => "jack.carmco@yahoo.com"
    end

    within_fieldset("Register") do
      fill_in 'password', :with => "password"
    end

    click_button('Create')

    visit '/'
    expect(page).to have_content "logout"
  end
end
