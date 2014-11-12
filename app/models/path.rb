class Path < ActiveRecord::Base

  attr_accessible :name, :mode

  has_and_belongs_to_many :waypoints
  has_and_belongs_to_many :clients, association_foreign_key: 'waypoint_id', join_table: 'paths_waypoints'
  has_and_belongs_to_many :branches, association_foreign_key: 'waypoint_id', join_table: 'paths_waypoints'

  belongs_to :user

  def as_json
    super(:name, :mode, :clients, :waypoints)
  end

  def total_distance

  end

end
