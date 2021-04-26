class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :address
      t.string :phone_number
      t.integer :age
      t.string :vaccine_type
      t.string :state
      t.string :city
      t.string :gender
      t.string :image_url

      t.timestamps
    end
  end
end
