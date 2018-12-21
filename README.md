# Contact Management System


### Entity Relationships
Employee<br>
has_many :groups
- first_name: string
- last_name: string
- email: string
- aadhar: integer
- password: string
- password_confirmation: string

Group<br>
belongs_to :employee<br>
has_many :contacts
- name: string: unique
- status: boolean

Contact<br>
belongs_to :group
- name: string
- email: string
- mobile: integer