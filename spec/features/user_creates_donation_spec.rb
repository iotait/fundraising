require "rails_helper"

feature "User creates donation" do
  scenario "successfully" do
    @teacher = Teacher.create!(name: "Jeff", email: "j@gmail.com", phone: "0123456789", goal: 100)
    @student = Student.create!(id: 1, teacher_id: 1, name: "Bill", goal: 100)
    visit "/donations"

    click_on "Add a new donation"
    fill_in "Student", with: 1
    fill_in "Donor", with: "Grandpa"
    fill_in "Amount", with: 50
    click_on "Submit"
    expect(page).to have_css ".donations li", text: "Grandpa"
  end
end
