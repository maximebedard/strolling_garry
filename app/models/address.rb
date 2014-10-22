class Address < ActiveRecord::Base
  # attr_accessible :title, :body

  def complete
    "#{number} #{street}, #{city}, #{province}, Canada"
  end

end
