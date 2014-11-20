module Addressable
  extend ActiveSupport::Concern

  included do
    has_one :address, as: :addressable, dependent: :delete
    accepts_nested_attributes_for :address
  end

end
