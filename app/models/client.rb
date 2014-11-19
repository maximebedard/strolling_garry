class Client < ActiveRecord::Base
  include Addressable

  attr_accessible :name, :description, :estimated_delivery_time, :delivery_item

  validates_numericality_of :estimated_delivery_time

  has_and_belongs_to_many :path

end
