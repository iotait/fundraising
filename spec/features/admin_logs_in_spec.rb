require "rails_helper"

feature "Admin logs in" do
  scenario "successfully" do
    sign_in FactoryBot.create(:admin)
  end

  scenario "unsuccessfully" do
    visit "/users/sign_in"

    click_on "Log in"
    fill_in "Email", with: "email"
    fill_in "Password", with: "guess"
    click_on "Log in"

    expect(page).to have_css "h1", text: "Log in"
  end
end
