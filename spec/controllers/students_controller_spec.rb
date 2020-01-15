require "rails_helper"

feature "Students" do
  it "can be viewed by anyone" do
    student = FactoryBot.create(:student)

    visit student_path(student)
    expect(page).to have_http_status(200)
  end

  it "can be created by a teacher or admin" do
    teacher = FactoryBot.build_stubbed(:teacher)
    sign_in teacher.school.admin

    visit new_student_path
    expect(page).to have_http_status(200)
    sign_out teacher.school.admin

    sign_in teacher

    visit new_student_path
    expect(page).to have_http_status(200)
  end

  it "can't be created by a non-teacher or admin" do
    sign_in FactoryBot.build_stubbed(:student)

    visit new_student_path
    expect(page).to have_current_path("/")
  end

  it "can be edited by anyone signed in" do
    student = FactoryBot.create(:student)
    sign_in student.teacher.school.admin

    visit edit_student_path(student)
    expect(page).to have_http_status(200)
    sign_out student.teacher.school.admin

    sign_in student.teacher

    visit edit_student_path(student)
    expect(page).to have_http_status(200)
    sign_out student.teacher

    sign_in student

    visit edit_student_path(student)
    expect(page).to have_http_status(200)
  end

  it "can't be edited by anyone not signed in" do
    student = FactoryBot.create(:student)

    visit edit_student_path(student)
    expect(page).to have_current_path("/users/sign_in")
  end
end
