require "rails_helper"

feature "User visits admins page" do
  scenario "successfully" do
    visit "/admins"
    expect(page).to have_css "h1", text: "Admins"
  end
end
