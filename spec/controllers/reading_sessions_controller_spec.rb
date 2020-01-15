require "rails_helper"

feature "Reading Sessions" do
  it "can be created by anyone signed in" do
    student = FactoryBot.build_stubbed(:student)
    sign_in student.teacher.school.admin

    visit "/students/" + student.id.to_s + "/reading_sessions/new"
    expect(page).to have_http_status(200)
    sign_out student.teacher.school.admin

    sign_in student.teacher
    visit "/students/" + student.id.to_s + "/reading_sessions/new"
    expect(page).to have_http_status(200)
    sign_out student.teacher

    sign_in student
    visit "/students/" + student.id.to_s + "/reading_sessions/new"
    expect(page).to have_http_status(200)
  end

  it "can't be created by someone who isn't signed in" do
    student = FactoryBot.build_stubbed(:student)
    visit "/students/" + student.id.to_s + "/reading_sessions/new"

    expect(page).to have_current_path("/users/sign_in")
  end

  it "can be edited by anyone signed in" do
    student = FactoryBot.create(:student_with_reading_session)
    sign_in student.teacher.school.admin

    visit "/students/" + student.id.to_s + "/reading_sessions/" + student.reading_sessions.first.id.to_s + "/edit"
    expect(page).to have_http_status(200)
    sign_out student.teacher.school.admin

    sign_in student.teacher
    visit "/students/" + student.id.to_s + "/reading_sessions/" + student.reading_sessions.first.id.to_s + "/edit"
    expect(page).to have_http_status(200)
    sign_out student.teacher

    sign_in student
    visit "/students/" + student.id.to_s + "/reading_sessions/" + student.reading_sessions.first.id.to_s + "/edit"
    expect(page).to have_http_status(200)
  end

  it "can't be edited by someone who isn't signed in" do
    student = FactoryBot.create(:student_with_reading_session)
    visit "/students/" + student.id.to_s + "/reading_sessions/" + student.reading_sessions.first.id.to_s + "/edit"

    expect(page).to have_current_path("/users/sign_in")
  end
end
