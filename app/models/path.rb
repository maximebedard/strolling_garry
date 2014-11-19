class Path < ActiveRecord::Base

  # Attributes
  attr_accessible :name, :mode, :date, :distance, :distance_time, :path_type, :branch_id,
    :waypoints_attributes, :clients_attributes, :potential_clients_attributes


  # Relations
  has_many :waypoints
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :potential_clients, association_foreign_key: 'client_id', join_table: 'clients_paths'
  belongs_to :branch
  belongs_to :user

  # Validations
  validates :name, presence:true
  validates :mode, presence:true
  validates :path_type, inclusion: { in: %w(delivery marketing) }

  # Nested attributes
  accepts_nested_attributes_for :waypoints, :clients, :potential_clients

  def as_json(options = {})
    super({ include: [:waypoints, :clients, :branch] }.merge(options))
  end

end
