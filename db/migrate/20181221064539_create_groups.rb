class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.belongs_to :employee, foreign_key: true
      t.string :name
      t.boolean :active

      t.timestamps
    end
    add_index :groups, :name
  end
end
