require 'rails_helper'

RSpec.describe Client, :type => :model do

  it "created with an address" do
    client = create :client
    address = create :address
    client.address = address
    expect(client.address).to eq(address)
  end

  it "created with no address" do
    client = create :client
    expect(client.address).to eq(nil)
  end

  pending "creates a client with no name and no address"

end
