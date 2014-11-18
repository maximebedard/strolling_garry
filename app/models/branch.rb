class Branch < Waypoint
  include Addressable

  attr_accessible :name, :description

  has_many :paths

end
