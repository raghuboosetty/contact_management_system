module Entities
  class Employee < Grape::Entity
    expose :first_name
    expose :last_name
    expose :aadhar
  end
end
