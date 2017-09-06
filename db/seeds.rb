# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless ReceptionDesk.find_by name: "第一エリア案内所"
  ReceptionDesk.create(name: "第一エリア案内所", location: "第一エリア")
end
unless ReceptionDesk.find_by name: "第二・三エリア案内所"
  ReceptionDesk.create(name: "第二・三エリア案内所", location: "第二・三エリア")
end
unless ReceptionDesk.find_by name: "体芸エリア案内所"
  ReceptionDesk.create(name: "体芸エリア案内所", location: "体芸エリア")
end
unless ReceptionDesk.find_by name: "会館エリア案内所"
  ReceptionDesk.create(name: "会館エリア案内所", location: "会館エリア")
end
unless ReceptionDesk.find_by name: "実委室"
  ReceptionDesk.create(name: "実委室", location: "実委室")
end
