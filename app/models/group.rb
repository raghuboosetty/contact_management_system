class Group < ApplicationRecord
  belongs_to :employee
  has_many :contacts, dependent: :destroy
end
