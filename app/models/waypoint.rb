class Waypoint < ActiveRecord::Base
  include Addressable

  attr_accessible :name, :description

  belongs_to :path

end
