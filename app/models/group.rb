class Group < ApplicationRecord
  belongs_to :employee
  has_many :contacts, dependent: :destroy
end

# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  name        :string
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_groups_on_employee_id  (employee_id)
#  index_groups_on_name         (name)
#
