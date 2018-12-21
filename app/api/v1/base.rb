require "grape-swagger"

module V1
  class Base < Grape::API
    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @employee = Employee.find_by_authentication_token(params[:access_token])
      end

      def current_employee
        warden.user || @employee
      end
    end


    mount V1::Employee
    mount V1::Group
    mount V1::Contact
  end
end