
user1 = User.create(email_address: 'sanjay123@gmail.com', password: "n12345678")
user2 = User.create(email_address: 'nitin@gmail.com', password: "n12345678")
admin = User.create(email_address: 'admin@gmail.com', password: "n12345678", role: 1)

user2.build_profile(employee_name: 'nitin gojiya', department: 'Devloper', job_title: 'ror backend', phone_number: '9313295400', city: 'Rajkot', father_name: 'm', mother_name: 'k', acount_number: '12345678901234')
tech = [ "ROR", "MERN", "Java" ]
[ "hrms", "e-commerce", "Finacial" ].each_with_index do |project, index|
  Project.create(p_name: project, start_date: Time.now+index.day, end_date: Time.now+(index*10).day, tech: tech[index])
end
