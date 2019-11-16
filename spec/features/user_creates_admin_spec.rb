require "rails_helper"

feature "User creates admin" do
  scenario "successfully" do
    visit "/admins"

    click_on "Add a new admin"
    fill_in "Name", with: "XYZ"
    fill_in "Email", with: "XYZ@gmail.com"
    fill_in "Phone", with: "0123456789"
    click_on "Submit"
    expect(page).to have_css ".admins li", text: "XYZ"
  end
end
