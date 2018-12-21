class AddAuthTokenToEmployees < ActiveRecord::Migration[5.2]
  def change
    change_table :employees do |t|
      t.string :authentication_token
    end
    
    add_index  :employees, :authentication_token, unique: true
  end
end
