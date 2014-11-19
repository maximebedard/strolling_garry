FactoryGirl.define do

  factory :user do
    #name "Marcel"
    email "user@user.com"
    password "bob12345"
    password_confirmation "bob12345"
  end


  factory :address do
    number 66
    street 'Racine'
    city 'Pincourt'
    country 'Canada'
    province 'Quebec'
    postal_code 'J7V 8E9'
  end

  factory :path do
    name 'Test path'
    mode 'car'
    path_type 'delivery'
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

  factory :potential_client do
    name 'Test client potentiel'
    description 'this is a test potential client'
  end

end
