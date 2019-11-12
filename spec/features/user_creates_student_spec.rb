require "rails_helper"

feature "User creates student" do
  scenario "successfully" do
    visit "/students"
    click_on "Add a new student"
    fill_in "Name", with: "Billy"
    fill_in "Goal", with: 500
    click_on "Submit"
    expect(page).to have_css ".students li", text: "Billy"
  end
end
