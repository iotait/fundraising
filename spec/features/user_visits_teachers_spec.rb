require "rails_helper"

feature "User visits teachers page" do
  scenario "successfully" do
    visit "/teachers"
    expect(page).to have_css "h1", text: "Teachers"
  end
end
