class Waypoint < ActiveRecord::Base
  include Addressable

  #attr_accessible :name, :description, :elevation

  belongs_to :path

end
