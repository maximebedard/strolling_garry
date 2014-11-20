module Addressable
  extend ActiveSupport::Concern

  included do
    has_one :address, as: :addressable
    #attr_accessible :address
  end

end
