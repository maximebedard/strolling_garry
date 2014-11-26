class Client < ActiveRecord::Base
  include Addressable

  # Validations
  validates_numericality_of :estimated_delivery_time
  validates :name, presence:true

  # Relations
  has_and_belongs_to_many :path

  def as_json(options = {})
    super({ include: [:address] }.merge(options))
  end



end
