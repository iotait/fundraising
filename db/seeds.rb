admin = Admin.create(first_name:"joe", last_name:"smith", email: "joe@smith.com", password: "asdf1234", password_confirmation: "asdf1234")

school = School.create(name: "Brooks Via", goal: 1000, admin: admin)

teacher = Teacher.create(first_name:"sally", last_name:"smith", email: "sally@smith.com", password: "asdf1234", password_confirmation: "asdf1234", school: school)

kid1 = Student.create(first_name:"john", last_name:"smith", email: "john@jones.com", password: "asdf1234", password_confirmation: "asdf1234", teacher: teacher, school: school)
kid2 = Student.create(first_name:"frank", last_name:"smith", email: "frank@jones.com", password: "asdf1234", password_confirmation: "asdf1234", teacher: teacher, school: school)
kid3 = Student.create(first_name:"tucker", last_name:"smith", email: "tucker@jones.com", password: "asdf1234", password_confirmation: "asdf1234", teacher: teacher, school: school)
