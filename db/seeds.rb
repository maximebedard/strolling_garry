# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


(1..20).each do |n|
  path = Path.create(name: "Chemin #{n}")

  (1..10).each do |m|
    path.clients << Client.create(name: "Client #{n}-#{m}")
  end

end
