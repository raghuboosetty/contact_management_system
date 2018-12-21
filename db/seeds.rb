unless Employee.find_by_email('employee_1@inmar.com')
  puts 'Seeding Employee...'
  Employee.create(email: 'employee_1@inmar.com', password: 'password', password_confirmation: 'password')
end