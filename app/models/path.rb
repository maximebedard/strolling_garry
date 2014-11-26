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


  validate :max_clients
  validate :max_potential_clients



  # Nested attributes
  accepts_nested_attributes_for :clients, :potential_clients

  def as_json(options = {})
    super({ include: [:clients, :branch, :potential_clients] }.merge(options))
  end


  private

    MAX_WAYPOINT = 8
    # Limit the number of waypoint set by googole API
    def max_clients
      errors.add(:clients, "has more than #{MAX_WAYPOINT} clients.") if clients.size > MAX_WAYPOINT
    end

    def max_potential_clients
      errors.add(:potential_clients, "has more than #{MAX_WAYPOINT} clients.") if potential_clients.size > MAX_WAYPOINT
    end



end
