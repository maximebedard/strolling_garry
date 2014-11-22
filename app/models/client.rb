class Client < ActiveRecord::Base
  include Addressable

  validates_numericality_of :estimated_delivery_time

  has_and_belongs_to_many :path


end
