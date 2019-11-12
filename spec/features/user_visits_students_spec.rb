require "rails_helper"

feature "User visits students page" do
  scenario "successfully" do
    visit "/students"
    expect(page).to have_css "h1", text: "Students"
  end
end
