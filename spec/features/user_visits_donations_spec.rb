require "rails_helper"

feature "User visits donations page" do
  scenario "successfully" do
    visit "/donations"
    expect(page).to have_css 'h1', text: 'Donations'
  end
end