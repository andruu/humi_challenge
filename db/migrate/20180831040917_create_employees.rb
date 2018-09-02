class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.integer :marital_status
      t.string :encrypted_sin
      t.date :hire_date
      t.json :preferences

      t.timestamps
    end
  end
end
