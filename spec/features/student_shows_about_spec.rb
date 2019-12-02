require "rails_helper"

feature "student shows" do
  scenario "about section when present" do
    admin = FactoryBot.create(:admin)
    student = FactoryBot.create(:student, about: "We want desks!")
    visit "/"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_on "Log in"

    visit "/students/" + student.id.to_s

    expect(page).to have_css "p", text: "We want desks!"
  end

  scenario "no about section when absent" do
    admin = FactoryBot.create(:admin)
    student = FactoryBot.create(:student)
    visit "/"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_on "Log in"

    visit "/students/" + student.id.to_s

    expect(page).not_to have_css "p", text: "We want desks!"
  end
end
