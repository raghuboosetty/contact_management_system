class RegistrationsController < Devise::RegistrationsController


private
  def sign_up_params
    params.require(:employee).permit(:first_name, :last_name, :aadhar, :email, :password, :password_confirmation)
  end
end