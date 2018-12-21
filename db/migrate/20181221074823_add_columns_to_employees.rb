class AddColumnsToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :aadhar, :integer
  end
end
