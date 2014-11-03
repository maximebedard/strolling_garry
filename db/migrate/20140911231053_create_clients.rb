class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.integer :elevation
      t.timestamps
    end
  end
end
