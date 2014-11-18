class Path < ActiveRecord::Base

  # Attributes
  attr_accessible :name, :mode, :date, :distance, :distance_time, :path_type

  # Relations
  has_and_belongs_to_many :waypoints
  has_and_belongs_to_many :clients, association_foreign_key: 'waypoint_id', join_table: 'paths_waypoints'
  has_and_belongs_to_many :branches, association_foreign_key: 'waypoint_id', join_table: 'paths_waypoints'

  belongs_to :user

  # Validations
  validates :name, presence:true
  validates :mode, presence:true
  validates :path_type, inclusion: { in: %w(delivery marketing) }


  def as_json(options = {})
    super({ include: [:waypoints, :clients] }.merge(options))
  end

end
