class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
