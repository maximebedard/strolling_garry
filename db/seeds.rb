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



#PotentialClient.create(name:"Rockland Centre",            description:'', address:Address.create(latitude:45.528621, longitude:-73.649395))
PotentialClient.create(name:"Carrefour Angrignon",        description:'', address:Address.create(latitude:45.449737, longitude:-73.618579))
PotentialClient.create(name:"Plaza Cote-des-Neiges",      description:'', address:Address.create(latitude:45.495876, longitude:-73.610362))
#PotentialClient.create(name:"Cavendish Mall",             description:'', address:Address.create(latitude:52.939916, longitude:-73.549136))
PotentialClient.create(name:"Galeries d'Anjou",           description:'', address:Address.create(latitude:45.60015,  longitude:-73.571086))
PotentialClient.create(name:"Carrefour Langelier",        description:'', address:Address.create(latitude:46.81166,  longitude:-71.230931))
PotentialClient.create(name:"Place Versailles",           description:'', address:Address.create(latitude:45.992085, longitude:-73.446032))
PotentialClient.create(name:"Fairview Pointe-Claire",     description:'', address:Address.create(latitude:45.475212, longitude:-73.82319))
PotentialClient.create(name:"Place Ville-Marie",          description:'', address:Address.create(latitude:45.5015,   longitude:-73.5684))
PotentialClient.create(name:"Eaton Centre",               description:'', address:Address.create(latitude:45.503053, longitude:-73.57121))
#PotentialClient.create(name:"Complexe Les Ailes",         description:'', address:Address.create(latitude:52.939916, longitude:-73.549136))
#PotentialClient.create(name:"Promenades de la Cathedrale",description:'', address:Address.create(latitude:52.939916, longitude:-73.549136))
PotentialClient.create(name:"Complexe Desjardins",        description:'', address:Address.create(latitude:45.50744,  longitude:-73.564413))
PotentialClient.create(name:"Westmount Square",           description:'', address:Address.create(latitude:45.487256, longitude:-73.587728))
PotentialClient.create(name:"Place Alexis-Nihon",         description:'', address:Address.create(latitude:45.50633,  longitude:-73.692546))
PotentialClient.create(name:"Faubourg Ste. Catherine",    description:'', address:Address.create(latitude:45.494648, longitude:-73.57745))
#PotentialClient.create(name:"Museum Quarter",             description:'', address:Address.create(latitude:52.939916, longitude:-73.549136))
#PotentialClient.create(name:"Ogilvy's",                   description:'', address:Address.create(latitude:52.939916, longitude:-73.549136))
PotentialClient.create(name:"Les Cours Mont-Royal",       description:'', address:Address.create(latitude:45.510407, longitude:-73.571196))
#PotentialClient.create(name:"Place Montreal Trust",       description:'', address:Address.create(latitude:52.939916, longitude:-73.549136))





Client.create(name:"St Mary's Hospital",                      description:'', estimated_delivery_time:1, address:Address.create(latitude:45.49504,  longitude:-73.623843))
#Client.create(name:"St Justine Hospital",                     description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
#Client.create(name:"Ste Jeanne D'Arc Hospital",               description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
Client.create(name:"Shriners Hospital",                       description:'', estimated_delivery_time:1, address:Address.create(latitude:45.499578, longitude:-73.58822))
Client.create(name:"Santa Cabrini Hospital",                  description:'', estimated_delivery_time:1, address:Address.create(latitude:45.580123, longitude:-73.571652))
Client.create(name:"Saint-Luc Hospital",                      description:'', estimated_delivery_time:1, address:Address.create(latitude:45.512182, longitude:-73.557841))
Client.create(name:"Sacre Coeur Hospital",                    description:'', estimated_delivery_time:1, address:Address.create(latitude:45.532973, longitude:-73.71485))
Client.create(name:"Royal Victoria Hospital",                 description:'', estimated_delivery_time:1, address:Address.create(latitude:45.508499, longitude:-73.5817))
Client.create(name:"Riviere-Des-Prairies Hospital",           description:'', estimated_delivery_time:1, address:Address.create(latitude:45.622345, longitude:-73.610697))
Client.create(name:"Richardson Hospital",                     description:'', estimated_delivery_time:1, address:Address.create(latitude:45.471921, longitude:-73.645822))
Client.create(name:"Notre-Dame Hospital",                     description:'', estimated_delivery_time:1, address:Address.create(latitude:45.525718, longitude:-73.562599))
#Client.create(name:"Mount Sinai Hospital",                    description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
Client.create(name:"Montreal Neurological Institute",         description:'', estimated_delivery_time:1, address:Address.create(latitude:45.509124, longitude:-73.581383))
#Client.create(name:"Montreal Heart Institute",                description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
Client.create(name:"Montreal General Hospital",               description:'', estimated_delivery_time:1, address:Address.create(latitude:45.496931, longitude:-73.588818))
Client.create(name:"Montreal Chinese Hospital",               description:'', estimated_delivery_time:1, address:Address.create(latitude:45.509508, longitude:-73.557823))
Client.create(name:"Montreal Children's Hospital",            description:'', estimated_delivery_time:1, address:Address.create(latitude:45.488748, longitude:-73.582187))
Client.create(name:"Montreal Chest Institute",                description:'', estimated_delivery_time:1, address:Address.create(latitude:45.513014, longitude:-73.57521))
Client.create(name:"McGill University Health Centre",         description:'', estimated_delivery_time:1, address:Address.create(latitude:45.472901, longitude:-73.601017))
#Client.create(name:"Marie Clarac Hospital",                   description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
Client.create(name:"Maisonneuve-Rosemont Hospital",           description:'', estimated_delivery_time:1, address:Address.create(latitude:45.57415,  longitude:-73.559699))
Client.create(name:"Maimonides Geriatric Centre",             description:'', estimated_delivery_time:1, address:Address.create(latitude:45.471445, longitude:-73.669767))
#Client.create(name:"Lindsay Convalescent Hospital",           description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
#Client.create(name:"Lasalle General Hospital",                description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
Client.create(name:"Lakeshore General Hospital",              description:'', estimated_delivery_time:1, address:Address.create(latitude:45.448386, longitude:-73.833886))
#Client.create(name:"Lachine General Hospital",                description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
#Client.create(name:"Julius Richardson Convalescent Hospital", description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
Client.create(name:"Jewish General Hospital",                 description:'', estimated_delivery_time:1, address:Address.create(latitude:45.498025, longitude:-73.628789))
Client.create(name:"Jean-Talon Hospital",                     description:'', estimated_delivery_time:1, address:Address.create(latitude:45.332794, longitude:-73.267507))
Client.create(name:"Hotel Dieu de Montreal",                  description:'', estimated_delivery_time:1, address:Address.create(latitude:45.51356,  longitude:-73.577295))
#Client.create(name:"Guy Laporte Hospital",                    description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
Client.create(name:"Fleury Hospital",                         description:'', estimated_delivery_time:1, address:Address.create(latitude:45.572056, longitude:-73.650267))
Client.create(name:"Douglas Hospital",                        description:'', estimated_delivery_time:1, address:Address.create(latitude:45.483519, longitude:-73.58062))
#Client.create(name:"Cite de la Sante",                        description:'', estimated_delivery_time:1, address:Address.create(latitude:45.602243, longitude:-73.712438))
Client.create(name:"Charles Lemoyne Hospital",                description:'', estimated_delivery_time:1, address:Address.create(latitude:45.497005, longitude:-73.486823))
Client.create(name:"Catherine Booth Hospital",                description:'', estimated_delivery_time:1, address:Address.create(latitude:45.463802, longitude:-73.635738))
#Client.create(name:"Anna Laberge Hospital",                   description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
#Client.create(name:"Albert Prevost Hospital",                 description:'', estimated_delivery_time:1, address:Address.create(latitude:52.939916, longitude:-73.549136))
