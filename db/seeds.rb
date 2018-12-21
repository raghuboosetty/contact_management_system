unless Employee.find_by_email('employee_1@inmar.com')
  puts 'Seeding Employee...'
  Employee.create(first_name: 'employee', last_name: 'one', aadhar: 123445544, email: 'employee_1@inmar.com', password: 'P@55w0rd', password_confirmation: 'P@55w0rd')
end