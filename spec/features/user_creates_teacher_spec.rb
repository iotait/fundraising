require "rails_helper"

feature "User creates teacher" do
  scenario "successfully" do
    visit "/teachers"
    click_on "Add a new teacher"
    fill_in "Name", with: "Sarah"
    fill_in "Email", with: "sarah@example.com"
    fill_in "Phone", with: "123-456-7890"
    fill_in "Goal", with: 500
    click_on "Submit"
    expect(page).to have_css ".teachers li", text: "Sarah"
  end
end
