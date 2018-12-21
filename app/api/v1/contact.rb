module V1
  class Contact < Grape::API 

    before do
      error!("401 Unauthorized", 401) unless authenticated
    end


    resource :contact do
      desc "New Contact Request"
      params do
        requires :access_token, type: String, desc: "Token"
        requires :group_id, type: Integer, desc: "Group Id"
        requires :name, type: String, desc: "Name"
        requires :email, type: String, desc: "Email"
        requires :phone, type: Integer, desc: "Phone"
      end
      post do 
        group = current_employee.groups.where(id: params[:group_id]).first
        contact = group.contacts.new(params.slice(:email, :phone, :name)) if group
        if group && contact.save
          status 201
          { message: 'Successful' }
        else
          error!(contact.errors, 403)
        end
      end
    end

  end
end