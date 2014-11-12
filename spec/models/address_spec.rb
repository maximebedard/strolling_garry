require 'rails_helper'

RSpec.describe Address, :type => :model do

  it "creates an address from factory" do
    addr = create :address
    expect(addr.longitude).not_to be_nil
    expect(addr.latitude).not_to be_nil
  end

end
