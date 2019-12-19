require "rails_helper"

xfeature "School shows" do
  scenario "about section when present" do
    school = FactoryBot.create(:school, about: "We want desks!")
    sign_in FactoryBot.create(:admin)

    visit "/schools/" + school.id.to_s

    expect(page).to have_css "p", text: "We want desks!"
  end

  scenario "no about section when absent" do
    school = FactoryBot.create(:school)
    sign_in FactoryBot.create(:admin)

    visit "/schools/" + school.id.to_s

    expect(page).not_to have_css "p", text: "We want desks!"
  end
end
