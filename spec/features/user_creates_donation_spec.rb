require "rails_helper"

feature "User creates donation" do
  scenario "successfully" do
    @admin = Admin.create!(first_name: "Bill", last_name: "in charge", email: "bill@incharge.com", phone: "3456789012")
    @school = School.create!(admin_id: 1, name: "xyz", email: "xyz@gmail.com", phone: "1234567890", address: "123 school lane", about: "Buy desks", goal: 5000)
    @teacher = Teacher.create!(school_id: 1, first_name: "Jeff", last_name: "Jeffery", email: "j@gmail.com", phone: "0123456789", goal: 100)
    @student = Student.create!(teacher_id: 2, first_name: "Bill", last_name: "Bunny", email: "bb@yahoo", about: "let's do this!", goal: 100)
    visit "/donations"

    click_on "Add a new donation"
    fill_in "Student", with: 3 # It is the third user created
    fill_in "Donor", with: "Grandpa"
    fill_in "Amount", with: 50
    fill_in "Message", with: "Glad to help son!"
    click_on "Submit"
    expect(page).to have_css ".donations li", text: "Grandpa"
  end
end
