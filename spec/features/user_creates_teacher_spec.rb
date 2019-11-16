require "rails_helper"

feature "User creates teacher" do
  scenario "successfully" do
    @admin = Admin.create!(name: "Bill", email: "bill@incharge.com", phone: "3456789012")
    @school = School.create!(admin_id: 1, name: "xyz", email: "xyz@gmail.com", phone: "1234567890", address: "123 school lane", about: "Buy desks", goal: 5000)
    visit "/teachers"
    click_on "Add a new teacher"
    fill_in "School", with: 1
    fill_in "Name", with: "Sarah"
    fill_in "Email", with: "sarah@example.com"
    fill_in "Phone", with: "123-456-7890"
    fill_in "Goal", with: 500
    click_on "Submit"
    expect(page).to have_css ".teachers li", text: "Sarah"
  end
end
