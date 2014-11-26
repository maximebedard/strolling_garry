class Address < ActiveRecord::Base

  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.number      = geo.street_number
      obj.street      = geo.route
      obj.city        = geo.city
      obj.postal_code = geo.postal_code
      obj.country     = geo.country
      obj.province    = geo.state
    end
  end

  after_validation :reverse_geocode, if: :has_coordinates?
  after_validation :geocode, if: :has_location?, unless: :has_coordinates?


  belongs_to :addressable, polymorphic: true

  def location
    "#{number} #{street}, #{city}, #{province}, #{country} #{postal_code.upcase if !postal_code.nil?}"
  end

  private

    def has_coordinates?
      !latitude.nil? && !longitude.nil?
    end

    def has_location?
      location != ''
    end

end
