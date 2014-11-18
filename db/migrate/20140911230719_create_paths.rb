class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.integer :user_id
      t.integer :branch_id
      t.string :path_type
      t.string :name
      t.string :mode, default: 'car'
      t.date :date
      t.float :distance
      t.time :distance_time
      t.timestamps
    end

  end
end
