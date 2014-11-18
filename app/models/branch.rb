class Branch < ActiveRecord::Base
  include Addressable

  attr_accessible :name, :description

  has_many :paths

end
