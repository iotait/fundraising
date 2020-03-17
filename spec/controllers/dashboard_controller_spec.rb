require "rails_helper"

feature "Dashboard" do
  it "index is accessible to everyone" do
    visit "/"
    expect(page).to have_http_status(200)
  end

  it "about is accessible to everyone" do
    visit "/dashboard/about"
    expect(page).to have_http_status(200)
  end

  it "calculator is accessible to everyone" do
    visit "dashboard/calculator"
    expect(page).to have_http_status(200)
  end
end
