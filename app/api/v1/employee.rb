module V1
  class Employee < Grape::API 

    resource :employee do
      desc "Employee Signup Request"
      params do
        requires :first_name, type: String, desc: "First Name"
        requires :last_name, type: String, desc: "Last Name"
        requires :aadhar, type: Integer, desc: "Aadhar"
        requires :email, type: String, desc: "Email"
        requires :password, type: String, desc: "Password"
        requires :password_confirmation, type: String, desc: "Password Confirmation"
      end
      post do 
        employee = ::Employee.new(params.slice(:first_name, :last_name, :aadhar, :email, :password, :password_confirmation))
        if employee.save
          status 201
          { message: 'Successful' }
        else
          error!(employee.errors, 403)
        end
      end
    end

  end
end