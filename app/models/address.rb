class Address < ActiveRecord::Base
  attr_accessible :number, :street, :city, :country,
    :province, :postal_code, :latitude, :longitude

  belongs_to :addressable, polymorphic: true

  def complete
    "#{number} #{street}, #{city}, #{province}, #{country} #{postal_code.upcase}"
  end

end
