class Path < ActiveRecord::Base

  attr_accessible :name, :mode

  has_and_belongs_to_many :clients
  has_many :waypoints

  belongs_to :user

end
