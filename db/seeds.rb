# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

EventType.create!([
    {
     id: 1,
     name: "Montage Vector Gros Cutter",
     duree: 2
    },
    {
     id: 2,
     name: "Test Vector Gros Cutter",
     duree: 2.5
    },
    {
     id: 3,
     name: "Montage Vector Petit Cutter",
     duree: 2
    },
    {
     id: 4,
     name: "Test Vector Petit Cutter",
     duree: 4
    },
    {
     id: 5,
     name: "Versalis",
     duree: 2
    },
    {
     id: 6,
     name: "Carte Classique",
     duree: 2
    }
])