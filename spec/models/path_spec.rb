require 'rails_helper'

RSpec.describe Path, :type => :model do

  pending "is invalid without a name"

  it "has many waypoints" do
    path = create :path
    path.waypoints << create(:waypoint)
  end

  it "has many clients" do
    path = create :path
    path.clients << create(:client)
  end

  it "has on starting branch" do
    path = create :path
    path.branch = create(:branch)

  end

end
