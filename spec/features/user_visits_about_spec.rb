require "rails_helper"

feature "User visits about page" do
  scenario "successfully" do
    visit "static_pages/about"
    expect(page).to have_css "h1", text: "About"
  end
end
