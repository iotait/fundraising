require "rails_helper"

feature "Teacher logs in" do
  scenario "successfully" do
    sign_in FactoryBot.create(:teacher)
  end

  scenario "unsuccessfully" do
    visit "/users/sign_in"

    click_on "Log in"
    fill_in "Email", with: "email"
    fill_in "Password", with: "guess"
    click_on "Log in"

    expect(page).to have_css "a", text: "Log In"
  end
end
