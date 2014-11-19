class PotentialClient < ActiveRecord::Base
  include Addressable

  attr_accessible :name, :description

  has_and_belongs_to_many :path

end
