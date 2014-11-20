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

path1 = Path.create(name: 'Route 1', mode:'car', path_type: 'delivery')


path1.waypoints = [
             Waypoint.create(name:'Waypoint 1', description:'',
              address:Address.create(number:66, street: 'Racine', city: 'Pincourt', postal_code:'J7V 8E9')),
             Waypoint.create(name:'Waypoint 2', description:'',
              address:Address.create(number:1100, street: 'Notre-Dame Ouest', city: 'Montreal', postal_code:'H3C 1K3')),
             Waypoint.create(name:'Waypoint 3', description:'',
               address:Address.create(number:1909, street: 'Avenue des Canadiens-de-Montreal', city: 'Montreal', postal_code:'H4B 5G0')),
             Waypoint.create(name:'Waypoint 4', description:'',
               address:Address.create(number:4141, street: 'Avenue Pierre-de Coubertin', city: 'Montreal', postal_code:'H1V 3N7')),
            ]

admin.paths << path1

Branch.create(name: 'Branch 1', description:'',
  address:Address.create(number:66, street: 'Racine', city: 'Pincourt', postal_code:'J7V 8E9'))
Branch.create(name: 'Branch 2', description:'',
  address:Address.create(number:1100, street: 'Notre-Dame Ouest', city: 'Montreal', postal_code:'H3C 1K3'))
Branch.create(name: 'Branch 3', description:'',
  address:Address.create(number:1909, street: 'Avenue des Canadiens-de-Montreal', city: 'Montreal', postal_code:'H4B 5G0'))

(1..10).each do |i|
  Client.create(name: "Client #{i}", description: "This is a description", estimated_delivery_time: i)
end
