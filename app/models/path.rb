class Path < ActiveRecord::Base

  # Attributes
  attr_accessible :name, :mode, :date, :distance, :distance_time, :path_type, :branch_id, :waypoints, :clients

  # Relations
  has_many :waypoints
  has_and_belongs_to_many :clients
  belongs_to :branch
  belongs_to :user

  # Validations
  validates :name, presence:true
  validates :mode, presence:true
  validates :path_type, inclusion: { in: %w(delivery marketing) }

  def as_json(options = {})
    super({ include: [:waypoints, :clients, :branch] }.merge(options))
  end

end
