require "rails_helper"

feature "User creates student" do
  scenario "successfully" do
    @school = School.create!(name: "xyz", email: "xyz@gmail.com", phone: "1234567890", address: "123 school lane", about: "Buy desks", goal: 5000)
    @teacher = Teacher.create!(school_id: 1, name: "Jeff", email: "j@gmail.com", phone: "0123456789", goal: 100)
    visit "/students"

    click_on "Add a new student"
    fill_in "Id", with: "1"
    fill_in "School", with: "1"
    fill_in "Teacher", with: "1"
    fill_in "Name", with: "Billy"
    fill_in "Goal", with: 500
    click_on "Submit"
    expect(page).to have_css ".students li", text: "Billy"
  end
end
