module V1
  class Group < Grape::API 

    before do
      error!("401 Unauthorized", 401) unless authenticated
    end

    resource :group do
      desc "New Group Request"
      params do
        requires :access_token, type: String, desc: "Token"
        requires :name, type: String, desc: "Group Name"
        requires :active, type: Boolean, desc: "Is Group Active"
      end
      post do 
        group = current_employee.groups.new(params.slice(:name, :active))
        if group.save
          status 201
          { message: 'Successful' }
        else
          error!(group.error_messages, 403)
        end
      end
    end

    resource :groups do
      desc "View all Groups"
      params do
        requires :access_token, type: String, desc: "Token"
        optional :group_id, type: Integer, desc: "Group Id"
      end
      get do
        if params[:group_id]
          present current_employee.groups.where(id: params[:group_id]).first, with: Entities::Group
        else
          present current_employee.groups, with: Entities::Group
        end
      end
    end

  end
end