FactoryGirl.define do

  factory :user do
    #name "Marcel"
    email "user@user.com"
    password "bob12345"
    password_confirmation "bob12345"
  end


  factory :address do
    number 123
    street 'Notre-Dame'
    city 'Montreal'
    country 'Canada'
    province 'Quebec'
    postal_code 'J7V 8A1'
  end

  factory :path do
    name 'Test path'
    mode 'car'
  end

  factory :waypoint do
    name 'Test waypoint'
    description 'This is a test waypoint'
  end

  factory :client do
    name 'Test client'
    description 'This is a test client'
  end

  factory :branch do
    name 'Test branch'
    description 'This is a test branch'
  end

end
