require "rails_helper"

feature "User visits school page" do
  scenario "successfully" do
    visit "/schools"
    expect(page).to have_css "h1", text: "Schools"
  end
end
