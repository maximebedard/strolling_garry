FactoryGirl.define do


  factory :user do
    email "user@user.com"
    password "bob12345"
    password_confirmation "bob12345"
  end

  factory :admin, class: 'User' do
    email "user@user.com"
    password "bob12345"
    password_confirmation "bob12345"
    admin true
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
    mode 'DRIVING'
    path_type 'Delivery'
  end

  factory :client do
    name 'Test client'
    description 'This is a test client'
    estimated_delivery_time 42
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
