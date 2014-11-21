require 'rails_helper'

RSpec.describe Path, :type => :model do

  pending "is invalid without a name"

  it "has many clients" do
    path = create :path
    path.clients << create(:client)
  end

  it "has many potential clients" do
    path = create :path
    path.potential_clients << create(:potential_client)
  end

  it "has on starting branch" do
    path = create :path
    path.branch = create(:branch)

  end

end
