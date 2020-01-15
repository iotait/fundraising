require "rails_helper"

feature "Admin Dashboard" do
  it "is accessible to an admin" do
    sign_in FactoryBot.create(:admin)

    visit "/admins/1/dashboard"
    expect(page).to have_http_status(200)
  end

  it "is inaccessible to teachers" do
    sign_in FactoryBot.build_stubbed(:teacher)

    visit "/admins/1/dashboard"
    expect(page).to have_current_path("/")
  end

  it "is inaccessible to students" do
    sign_in FactoryBot.build_stubbed(:student)

    visit "/admins/1/dashboard"
    expect(page).to have_current_path("/")
  end

  it "is inaccessible to guests" do
    visit "/admins/1/dashboard"
    expect(page).to have_current_path("/users/sign_in")
  end
end

feature "end read-a-thon" do
  it "is accessible to an admin" do
    sign_in FactoryBot.build_stubbed(:admin)

    visit "/admins/1/end_read_a_thon"
    expect(page).to have_http_status(200)
  end

  it "is inaccessible to teachers" do
    sign_in FactoryBot.build_stubbed(:teacher)

    visit "/admins/1/end_read_a_thon"
    expect(page).to have_current_path("/")
  end

  it "is inaccessible to students" do
    sign_in FactoryBot.build_stubbed(:student)

    visit "/admins/1/dashboard"
    expect(page).to have_current_path("/")
  end

  it "is inaccessible to guests" do
    visit "/admins/1/dashboard"
    expect(page).to have_current_path("/users/sign_in")
  end
end
