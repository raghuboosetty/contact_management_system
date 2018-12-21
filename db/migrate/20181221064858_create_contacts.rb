class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.belongs_to :group, foreign_key: true
      t.string :name
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
