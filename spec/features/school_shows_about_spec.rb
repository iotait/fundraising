require "rails_helper"

feature "School shows" do
  scenario "no about section when absent" do
    school = FactoryBot.create(:school)
    sign_in FactoryBot.create(:admin)

    visit "/schools/" + school.id.to_s

    expect(page).not_to have_css "p", text: "We want desks!"
  end
end
