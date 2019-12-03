require "rails_helper"

feature "User signs up" do
  scenario "and is redirected to add a school" do
    visit "/users/sign_in"

    click_on "Sign up"
    fill_in "First name", with: "User"
    fill_in "Last name", with: "admin"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    expect(page).to have_css "h1", text: "Register your school"
  end
end
