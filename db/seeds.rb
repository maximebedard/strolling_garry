# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email:'admin@admin.com', password: 'bob12345', password_confirmation: 'bob12345')

(1..20).each do |n|
  admin.paths << Path.create(name: "Chemin #{n}")
end

(1..10).each do |n|
  admin.clients << Client.create(name: "Client #{n}")
end
