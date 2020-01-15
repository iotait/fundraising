require "rails_helper"

feature "Teachers" do
  it "can be created by an admin" do
    sign_in FactoryBot.build_stubbed(:admin)

    visit new_teacher_path
    expect(page).to have_http_status(200)
  end

  it "can't be created by a non-admin" do
    student = FactoryBot.create(:student)
    sign_in student.teacher

    visit new_teacher_path
    expect(page).to have_current_path("/")
    sign_out student.teacher

    sign_in student
    visit new_teacher_path
    expect(page).to have_current_path("/")
  end

  it "can be edited by an admin or teacher" do
    teacher = FactoryBot.create(:teacher)
    sign_in teacher.school.admin

    visit edit_teacher_path(teacher)
    expect(page).to have_http_status(200)
    sign_out teacher.school.admin

    sign_in teacher

    visit edit_teacher_path(teacher)
    expect(page).to have_http_status(200)
  end

  it "can't be edited by a student" do
    student = FactoryBot.create(:student)
    sign_in student

    visit edit_teacher_path(student.teacher)
    expect(page).to have_current_path("/")
  end

  it "can't be edited by someone not signed in" do
    teacher = FactoryBot.create(:teacher)

    visit edit_teacher_path(teacher)
    expect(page).to have_current_path("/users/sign_in")
  end
end
