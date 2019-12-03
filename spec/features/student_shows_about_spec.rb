require "rails_helper"

feature "student shows" do
  scenario "about section when present" do
    student = FactoryBot.create(:student, about: "We want desks!")
    sign_in FactoryBot.create(:admin)

    visit "/students/" + student.id.to_s

    expect(page).to have_css "p", text: "We want desks!"
  end

  scenario "no about section when absent" do
    student = FactoryBot.create(:student)
    sign_in FactoryBot.create(:admin)

    visit "/students/" + student.id.to_s

    expect(page).not_to have_css "p", text: "We want desks!"
  end
end
