class Address < ActiveRecord::Base
  #attr_accessible :number, :street, :city, :country,
  #  :province, :postal_code, :latitude, :longitude

  geocoded_by :complete_address
  after_validation :geocode

  belongs_to :addressable, polymorphic: true

  def complete_address
    "#{number} #{street}, #{city}, #{province}, #{country} #{postal_code.upcase}"
  end

end
