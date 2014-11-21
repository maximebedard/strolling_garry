class Path < ActiveRecord::Base

  # Constants
  MODES = %w(car bus bicycle male)

  # Relations
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :potential_clients
  belongs_to :branch
  belongs_to :user

  # Validations
  validates :name, presence:true
  validates :mode, presence:true
  validates :path_type, inclusion: { in: %w(delivery marketing) }

  # Nested attributes
  accepts_nested_attributes_for :clients, :potential_clients

  def as_json(options = {})
    super({ include: [:waypoints, :clients, :branch] }.merge(options))
  end

end
