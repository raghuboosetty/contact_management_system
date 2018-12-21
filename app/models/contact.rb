class Contact < ApplicationRecord
  belongs_to :group

  validates :group_id, :name, presence: true
  validates :email, uniqueness: true
end

# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  name       :string
#  email      :string
#  phone      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_contacts_on_group_id  (group_id)
#
