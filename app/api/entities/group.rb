module Entities
  class Group < Grape::Entity
    expose :name
    expose :active
    expose :contacts, using: 'Entities::Contact'
  end
end
