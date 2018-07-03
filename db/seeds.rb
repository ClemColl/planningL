# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



### PLANNING ###

puts "###TEMPLATE Création d'un calendrier"
    Calendar.create!(id: 1, title: "Vector")

puts "###TEMPLATE Création des Teams"
    Team.create!([
        {id: 1, name: "Îlot 1", calendar_id: 1},
        {id: 2, name: "Îlot 2", calendar_id: 1},
        {id: 3, name: "Îlot 3", calendar_id: 1},
        {id: 4, name: "Îlot 4", calendar_id: 1},
        {id: 5, name: "Îlot 5", calendar_id: 1}
    ])

    User.create!([
        {name: "Non Assigné", team_id: 1},
        {name: "Non Assigné", team_id: 1},
        {name: "Non Assigné", team_id: 2},
        {name: "Non Assigné", team_id: 2},
        {name: "Non Assigné", team_id: 3},
        {name: "Non Assigné", team_id: 3},
        {name: "Non Assigné", team_id: 4},
        {name: "Non Assigné", team_id: 4},
        {name: "Non Assigné", team_id: 5},
        {name: "Non Assigné", team_id: 5}
    ])

puts "###DATA Création de cartes type"
    EventType.create!([
        {id: 1, name: "Montage Vector Gros Cutter"},
        {id: 2, name: "Test Vector Gros Cutter"},
        {id: 3, name: "Montage Vector Petit Cutter"},
        {id: 4, name: "Test Vector Petit Cutter"},
        {id: 5, name: "Versalis"}
    ])

    EventField.create!([
        {name: "Métier", field_type: "texte", event_type_id: 1},
        {name: "Gamme", field_type: "gamme", event_type_id: 1},
        {name: "Largeur chassis", field_type: "largeur_chassis", event_type_id: 1},
        {name: "ATO", field_type: "sous_ensemble", event_type_id: 1},
        {name: "Lattes", field_type: "sous_ensemble", event_type_id: 1},
        {name: "Turbine", field_type: "sous_ensemble", event_type_id: 1},
        {name: "EM", field_type: "sous_ensemble", event_type_id: 1},
        {name: "CODA", field_type: "sous_ensemble", event_type_id: 1},

        {name: "Métier", field_type: "texte", event_type_id: 2},
        {name: "Gamme", field_type: "gamme", event_type_id: 2},
        {name: "Largeur chassis", field_type: "largeur_chassis", event_type_id: 2},
        {name: "Date", field_type: "date", event_type_id: 2},
        {name: "Pièce", field_type: "texte", event_type_id: 2},
        {name: "Notes", field_type: "texte", event_type_id: 2},

        {name: "Métier", field_type: "texte", event_type_id: 3},
        {name: "Gamme", field_type: "gamme", event_type_id: 3},
        {name: "Découpeur", field_type: "sous_ensemble", event_type_id: 3},
        {name: "Lattes", field_type: "sous_ensemble", event_type_id: 3},
        {name: "Caisson Aspi", field_type: "sous_ensemble", event_type_id: 3},
        {name: "EM", field_type: "sous_ensemble", event_type_id: 3},
        {name: "CODA", field_type: "sous_ensemble", event_type_id: 3},

        {name: "Métier", field_type: "texte", event_type_id: 4},
        {name: "Gamme", field_type: "gamme", event_type_id: 4},
        {name: "Date", field_type: "date", event_type_id: 4},
        {name: "Pièce", field_type: "texte", event_type_id: 4},
        {name: "Notes", field_type: "texte", event_type_id: 4},

        {name: "Pièce", field_type: "texte", event_type_id: 5},
        {name: "Notes", field_type: "texte", event_type_id: 5}
    ])

### SUIVI D'ACTIVITÉ ###

puts "###DATA Création des machines pour suivi"
    Machine.create!([
        {id: 1, name: "Gros Vector"},
        {id: 2, name: "Petit Vector"},
        {id: 3, name: "Versalis"},
        {id: 4, name: "Focus Quantum"},
        {id: 5, name: "Virga"}
    ])