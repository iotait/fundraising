require "rails_helper"

feature "User creates donation" do
  scenario "successfully" do
    @student = Student.create!(name: "Jeff", goal: 100)
    visit "/donations"

    click_on "Add a new donation"
    fill_in "Student", with: 1
    fill_in "Donor", with: "Grandpa"
    fill_in "Amount", with: 50
    click_on "Submit"
    expect(page).to have_css ".donations li", text: "Grandpa"
  end
end
