require 'rails_helper'

RSpec.describe User, :type => :model do

  it "creates an admin" do
    create :admin
  end

  it "creates a user" do
    create :user
  end
end
