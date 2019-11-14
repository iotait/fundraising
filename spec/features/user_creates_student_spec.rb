require "rails_helper"

feature "User creates student" do
  scenario "successfully" do
    @teacher = Teacher.create!(name: "Jeff", email: "j@gmail.com", phone: "0123456789", goal: 100)
    visit "/students"

    click_on "Add a new student"
    fill_in "Id", with: "1"
    fill_in "Teacher", with: "1"
    fill_in "Name", with: "Billy"
    fill_in "Goal", with: 500
    click_on "Submit"
    expect(page).to have_css ".students li", text: "Billy"
  end
end
