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



Client.create(name:'Albert Prevost Hospital',                 description:'', estimated_delivery_time:1, address:Address.create(latitude:45.497005, longitude:-73.486823))
Client.create(name:'Anna Laberge Hospital',                   description:'', estimated_delivery_time:1, address:Address.create(latitude:45.498025, longitude:-73.628789))
Client.create(name:'Catherine Booth Hospital',                description:'', estimated_delivery_time:1, address:Address.create(latitude:45.431667, longitude:-73.675))
Client.create(name:'Charles Lemoyne Hospital',                description:'', estimated_delivery_time:1, address:Address.create(latitude:45.448386, longitude:-73.833886))
Client.create(name:'Cite de la Sante',                        description:'', estimated_delivery_time:1, address:Address.create(latitude:45.573018, longitude:-73.558423))
Client.create(name:'Douglas Hospital',                        description:'', estimated_delivery_time:1, address:Address.create(latitude:45.513014, longitude:-73.57521))
Client.create(name:'Fleury Hospital',                         description:'', estimated_delivery_time:1, address:Address.create(latitude:45.501689, longitude:-73.567256))
Client.create(name:'Guy Laporte Hospital Centre',             description:'', estimated_delivery_time:1, address:Address.create(latitude:45.509508, longitude:-73.557823))
Client.create(name:'Hotel Dieu de Montreal',                  description:'', estimated_delivery_time:1, address:Address.create(latitude:45.501689, longitude:-73.567256))
Client.create(name:'Jean-Talon Hospital',                     description:'', estimated_delivery_time:1, address:Address.create(latitude:45.509124, longitude:-73.581383))
Client.create(name:'Jewish General Hospital',                 description:'', estimated_delivery_time:1, address:Address.create(latitude:45.622345, longitude:-73.610697))
Client.create(name:'Julius Richardson Convalescent Hospital', description:'', estimated_delivery_time:1, address:Address.create(latitude:45.532973, longitude:-73.71485))
Client.create(name:'Lachine General Hospital',                description:'', estimated_delivery_time:1, address:Address.create(latitude:45.499578, longitude:-73.58822))

PotentialClient.create(name:"Le 1000 de la Gauchetiere", description:'', address:Address.create(latitude:45.49818 ,longitude:-73.566383))
PotentialClient.create(name:"2020 University"          , description:'', address:Address.create(latitude:35.749377,longitude:-78.694227))
PotentialClient.create(name:"Le Centre Eaton Montreal" , description:'', address:Address.create(latitude:45.503053,longitude:-73.57121))
PotentialClient.create(name:"Complexe Desjardins"      , description:'', address:Address.create(latitude:45.50744 ,longitude:-73.564413))
PotentialClient.create(name:"Complexe Guy-Favreau"     , description:'', address:Address.create(latitude:45.506592,longitude:-73.562759))
PotentialClient.create(name:"Faubourg Sainte-Catherine", description:'', address:Address.create(latitude:49.326193,longitude:6.067317))
PotentialClient.create(name:"Place Alexis Nihon"       , description:'', address:Address.create(latitude:45.50633 ,longitude:-73.692546))
PotentialClient.create(name:"Place Bonaventure"        , description:'', address:Address.create(latitude:45.4994  ,longitude:-73.5651))
PotentialClient.create(name:"Place Dupuis"             , description:'', address:Address.create(latitude:50.23543 ,longitude:4.20925))
PotentialClient.create(name:"Place Ville-Marie"        , description:'', address:Address.create(latitude:45.5015  ,longitude:-73.5684))
