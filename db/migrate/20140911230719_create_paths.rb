class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.integer :user_id
      t.string :name
      t.string :mode
      t.float :distance
      t.timestamps
    end

  end
end
