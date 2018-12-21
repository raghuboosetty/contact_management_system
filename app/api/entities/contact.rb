module Entities
  class Contact < Grape::Entity
    expose :name
    expose :email
    expose :phone
  end
end
