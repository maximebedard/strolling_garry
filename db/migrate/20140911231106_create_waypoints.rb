class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.integer :user_id
      t.integer :path_id
      t.string :name
      t.string :description
      t.integer :elevation
      t.timestamps
    end
  end
end
