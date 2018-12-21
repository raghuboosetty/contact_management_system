json.extract! contact, :id, :group_id, :name, :email, :phone, :created_at, :updated_at
json.url contact_url(contact, format: :json)
