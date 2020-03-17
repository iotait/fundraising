require "rails_helper"

feature "Schools" do
  it "can be viewed by anyone" do
    school = FactoryBot.create(:school)

    visit school_path(school)
    expect(page).to have_http_status(200)
  end

  it "can only be created by an admin" do
    sign_in FactoryBot.build_stubbed(:admin)

    visit new_school_path
    expect(page).to have_http_status(200)
  end

  it "can only be edited by an admin" do
    school = FactoryBot.create(:school)
    sign_in school.admin

    visit edit_school_path(school)
    expect(page).to have_http_status(200)
  end
end
