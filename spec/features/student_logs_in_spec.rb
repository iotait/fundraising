require "rails_helper"

feature "Student logs in" do
  scenario "successfully" do
    student = FactoryBot.create(:student)
    visit "/users/sign_in"

    click_on "Log in"
    fill_in "Email", with: student.email
    fill_in "Password", with: student.password
    click_on "Log in"

    expect(page).to have_css "h2", text: student.name
  end

  scenario "unsuccessfully" do
    visit "/users/sign_in"

    click_on "Log in"
    fill_in "Email", with: "email"
    fill_in "Password", with: "guess"
    click_on "Log in"

    expect(page).to have_css "h2", text: "Log in"
  end
end
