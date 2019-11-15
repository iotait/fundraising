require "rails_helper"

feature "User creates school" do
  scenario "successfully" do
    visit "/schools"

    click_on "Add a new school"
    fill_in "Name", with: "XYZ"
    fill_in "Email", with: "XYZ@gmail.com"
    fill_in "Phone", with: "0123456789"
    fill_in "Address", with: "123 School Lane"
    fill_in "About", with: "We're doing this to buy new desks"
    fill_in "Goal", with: 5000
    click_on "Submit"
    expect(page).to have_css ".schools li", text: "XYZ"
  end
end
