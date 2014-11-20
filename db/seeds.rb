# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email:'admin@admin.com',
  password: 'bob12345', password_confirmation: 'bob12345')

admin.toggle!(:admin)

Branch.create(name: 'Ecole de technologie superieure', description:'',
  address:Address.create(number:1100, street: 'Notre-Dame Ouest', city: 'Montreal', postal_code:'H3C 1K3'))
Branch.create(name: 'Centre Bell', description: '',
  address:Address.create(number:1909, street: 'Avenue des Canadiens-de-Montreal', city: 'Montreal', postal_code:'H4B 5G0'))
Branch.create(name: 'Stade Olympique', description: '',
  address:Address.create(number:4141, street: 'Avenue Pierre-de Coubertin', city: 'Montreal', postal_code:'H1V 3N7'))


(1..10).each do |i|
  Client.create(name: "Client #{i}", description: "This is a description", estimated_delivery_time: i,
  address:Address.create(number:1909, street: 'Avenue des Canadiens-de-Montreal', city: 'Montreal', postal_code:'H4B 5G0'))
end

(1..10).each do |i|
  PotentialClient.create(name: "Client #{i}", description: "This is a description")
end
