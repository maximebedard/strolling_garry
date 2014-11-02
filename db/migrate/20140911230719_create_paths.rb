class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :name
      t.string :mode
      t.timestamps
    end

  end
end
