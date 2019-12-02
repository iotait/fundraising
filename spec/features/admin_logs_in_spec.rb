require "rails_helper"

feature "Admin logs in" do
  scenario "successfully" do
    admin = FactoryBot.create(:admin)
    visit "/"

    click_on "Log in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_on "Log in"

    expect(page).to have_css "h2", text: admin.name
  end

  scenario "unsuccessfully" do
    visit "/"

    click_on "Log in"
    fill_in "Email", with: "email"
    fill_in "Password", with: "guess"
    click_on "Log in"

    expect(page).to have_css "h2", text: "Log in"
  end
end
