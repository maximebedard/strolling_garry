class CreatePathsWaypoints < ActiveRecord::Migration
  def change

    create_table :paths_waypoints, id: false do |t|
      t.belongs_to :path
      t.belongs_to :waypoint
      
    end

  end
end
