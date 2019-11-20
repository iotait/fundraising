require "rails_helper"

feature "User creates student" do
  scenario "successfully" do
    @admin = Admin.create!(first_name: "Bill", last_name: "in charge", email: "bill@incharge.com", phone: "3456789012")
    @school = School.create!(admin_id: 1, name: "xyz", email: "xyz@gmail.com", phone: "1234567890", address: "123 school lane", about: "Buy desks", goal: 5000)
    @teacher = Teacher.create!(school_id: 1, first_name: "Jeff", last_name: "Jeffery", email: "j@gmail.com", phone: "0123456789", goal: 100)
    visit "/students"

    click_on "Add a new student"
    fill_in "Teacher", with: "2" # Second user created
    fill_in "student_first_name", with: "Billy"
    fill_in "student_last_name", with: "Bunsly"
    fill_in "Email", with: "bb@gmail.com"
    fill_in "About", with: "I want new desks for my school"
    fill_in "Goal", with: 500
    click_on "Submit"
    expect(page).to have_css ".students li", text: "Billy"
  end
end
