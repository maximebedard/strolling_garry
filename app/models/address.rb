class Address < ActiveRecord::Base
  attr_accessible :number

  def complete
    "#{number} #{street}, #{city}, #{province}, Canada"
  end

end
