#encoding: utf-8
require 'rails_helper'

RSpec.describe Address, :type => :model do

  it "creates an address from factory and expect longitude and latitude to be set" do
    addr = create :address
    expect(addr.longitude).not_to be_nil
    expect(addr.latitude).not_to be_nil
  end

  it "creates an address from longitude and latitude" do
    addr = Address.create(latitude:45.37781, longitude:-73.97333)
    expect(addr.number).to eq(55)
    expect(addr.street).to eq('Rue Racine')
    expect(addr.city).to eq('Pincourt')
    expect(addr.postal_code).to eq('J7V 8E9')
    expect(addr.province).to eq('Québec');
    expect(addr.country).to eq('Canada')
  end

end
