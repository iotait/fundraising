require "rails_helper"

feature "Admin visits dash and sees" do
  scenario "prompt to add school when they haven't" do
    admin = FactoryBot.create(:admin)
    visit "/users/sign_in"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_on "Log in"

    visit "/admins/" + admin.id.to_s + "/dashboard"

    expect(page).to have_css "p", text: "Add a school"
  end

  scenario "no prompt to add school when it's already added" do
    admin = FactoryBot.create(:admin)
    FactoryBot.create(:school, admin: admin)
    visit "/users/sign_in"

    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_on "Log in"

    visit "/admins/" + admin.id.to_s + "/dashboard"

    expect(page).not_to have_css "p", text: "Add a school"
  end
end
