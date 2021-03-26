class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.string :address
      t.integer :phone_number
      t.integer :age
      t.string :brand
      t.string :state
      t.string :city
      t.string :gender

      t.timestamps
    end
  end
end
