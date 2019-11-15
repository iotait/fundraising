require "rails_helper"

feature "User visits school page" do
  scenario "successfully" do
    visit "/school"
    expect(page).to have_css "h1", text: "School"
  end
end
