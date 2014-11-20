class PotentialClient < ActiveRecord::Base
  include Addressable

  has_and_belongs_to_many :path

end
