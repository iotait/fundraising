require "rails_helper"

feature "User signs up" do
  scenario "and is given type Admin" do
    visit "/users/sign_up"

    fill_in "First name", with: "user"
    fill_in "Last name", with: "test"
    fill_in "Email", with: "user@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    fill_in "Name", with: "xyz"
    click_on "Submit"

    visit "/dashboard/user"

    expect(page).to have_css "h2", text: "Admin"
  end
end
