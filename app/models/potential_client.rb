class PotentialClient < ActiveRecord::Base
  include Addressable

  has_and_belongs_to_many :path

  def as_json(options = {})
    super({ include: [:address] }.merge(options))
  end

end
