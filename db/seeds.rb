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
        {name: "Îlot 1", calendar_id: 1},
        {name: "Îlot 2", calendar_id: 1},
        {name: "Îlot 3", calendar_id: 1},
        {name: "Îlot 4", calendar_id: 1},
        {name: "Îlot 5", calendar_id: 1}
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

puts "###TEST Création de rapports"
    Rapport.create!([
        {cta: 35, cas: 35, pdp: 108, dsa: 10, machine_id: 1, week: 13, next_cas: 1, next_pdp: 108},
        {cta: 35, cas: 4, pdp: 108, dsa: 10, machine_id: 1, week: 14, next_cas: 1, next_pdp: 108},
        {cta: 42, cas: 7, pdp: 108, dsa: 14, machine_id: 1, week: 15, next_cas: 0, next_pdp: 108},
        {cta: 42, cas: 0, pdp: 96, dsa: 13, machine_id: 1, week: 16, next_cas: 0, next_pdp: 108},
        {cta: 50, cas: 8, pdp: 96, dsa: 12, machine_id: 1, week: 17, next_cas: 6, next_pdp: 108},
        {cta: 51, cas: 1, pdp: 96, dsa: 14, machine_id: 1, week: 18, next_cas: 0, next_pdp: 108},
        {cta: 60, cas: 9, pdp: 96, dsa: 7, machine_id: 1, week: 19, next_cas: 0, next_pdp: 108},
        {cta: 65, cas: 5, pdp: 91, dsa: 8, machine_id: 1, week: 20, next_cas: 4, next_pdp: 110},

        {cta: 22, cas: 22, pdp: 43, dsa: 4, machine_id: 2, week: 13, next_cas: 1, next_pdp: 43},
        {cta: 22, cas: 2, pdp: 43, dsa: 4, machine_id: 2, week: 14, next_cas: 1, next_pdp: 43},
        {cta: 24, cas: 2, pdp: 43, dsa: 4, machine_id: 2, week: 15, next_cas: 3, next_pdp: 43},
        {cta: 27, cas: 3, pdp: 43, dsa: 3, machine_id: 2, week: 16, next_cas: 0, next_pdp: 43},
        {cta: 28, cas: 1, pdp: 43, dsa: 7, machine_id: 2, week: 17, next_cas: 5, next_pdp: 43},
        {cta: 30, cas: 2, pdp: 43, dsa: 7, machine_id: 2, week: 18, next_cas: 0, next_pdp: 43},
        {cta: 34, cas: 4, pdp: 43, dsa: 2, machine_id: 2, week: 19, next_cas: 0, next_pdp: 43},
        {cta: 35, cas: 1, pdp: 43, dsa: 9, machine_id: 2, week: 20, next_cas: 1, next_pdp: 40},

        {cta: 5, cas: 5, pdp: 16, dsa: 1, machine_id: 3, week: 13, next_cas: 1, next_pdp: 12},
        {cta: 5, cas: 1, pdp: 16, dsa: 1, machine_id: 3, week: 14, next_cas: 1, next_pdp: 12},
        {cta: 6, cas: 1, pdp: 16, dsa: 0, machine_id: 3, week: 15, next_cas: 1, next_pdp: 12},
        {cta: 6, cas: 0, pdp: 15, dsa: 0, machine_id: 3, week: 16, next_cas: 1, next_pdp: 12},
        {cta: 6, cas: 0, pdp: 15, dsa: 0, machine_id: 3, week: 17, next_cas: 1, next_pdp: 12},
        {cta: 6, cas: 0, pdp: 15, dsa: 0, machine_id: 3, week: 18, next_cas: 1, next_pdp: 12},
        {cta: 6, cas: 0, pdp: 15, dsa: 0, machine_id: 3, week: 19, next_cas: 1, next_pdp: 12},
        {cta: 6, cas: 0, pdp: 12, dsa: 0, machine_id: 3, week: 20, next_cas: 1, next_pdp: 12},

        {cta: 1, cas: 1, pdp: 5, dsa: 0, machine_id: 4, week: 13, next_cas: 0, next_pdp: 4},
        {cta: 1, cas: 1, pdp: 5, dsa: 0, machine_id: 4, week: 14, next_cas: 0, next_pdp: 4},
        {cta: 2, cas: 1, pdp: 5, dsa: 0, machine_id: 4, week: 15, next_cas: 0, next_pdp: 4},
        {cta: 2, cas: 0, pdp: 5, dsa: 0, machine_id: 4, week: 16, next_cas: 0, next_pdp: 4},
        {cta: 2, cas: 0, pdp: 5, dsa: 0, machine_id: 4, week: 17, next_cas: 0, next_pdp: 4},
        {cta: 2, cas: 0, pdp: 5, dsa: 0, machine_id: 4, week: 18, next_cas: 0, next_pdp: 4},
        {cta: 2, cas: 0, pdp: 4, dsa: 0, machine_id: 4, week: 19, next_cas: 0, next_pdp: 4},
        {cta: 2, cas: 0, pdp: 4, dsa: 0, machine_id: 4, week: 20, next_cas: 0, next_pdp: 4},

        {cta: 0, cas: 0, pdp: 5, dsa: 0, machine_id: 5, week: 13, next_cas: 0, next_pdp: 3},
        {cta: 0, cas: 0, pdp: 5, dsa: 0, machine_id: 5, week: 14, next_cas: 0, next_pdp: 3},
        {cta: 0, cas: 0, pdp: 5, dsa: 0, machine_id: 5, week: 15, next_cas: 0, next_pdp: 3},
        {cta: 0, cas: 0, pdp: 5, dsa: 0, machine_id: 5, week: 16, next_cas: 0, next_pdp: 3},
        {cta: 0, cas: 0, pdp: 5, dsa: 0, machine_id: 5, week: 17, next_cas: 2, next_pdp: 3},
        {cta: 0, cas: 0, pdp: 5, dsa: 1, machine_id: 5, week: 18, next_cas: 0, next_pdp: 3},
        {cta: 0, cas: 0, pdp: 5, dsa: 1, machine_id: 5, week: 19, next_cas: 0, next_pdp: 4},
        {cta: 0, cas: 0, pdp: 5, dsa: 3, machine_id: 5, week: 20, next_cas: 0, next_pdp: 4}
    ])

puts "###TEST Création de backlogs"
    Stock.create!([
        {smc: 26.22, rmc: 2.30, sma: 24.5, rma: 6, week: 13},
        {smc: 26.22, rmc: 2.30, sma: 24.5, rma: 6, week: 14},
        {smc: 26.29, rmc: 3.684, sma: 24.5, rma: 6, week: 15},
        {smc: 26.29, rmc: 3.684, sma: 24.5, rma: 6, week: 16},
        {smc: 25.6, rmc: 6.125, sma: 25, rma: 6, week: 17},
        {smc: 26.4, rmc: 1.3, sma: 25, rma: 5.8, week: 18},
        {smc: 26.9, rmc: 2.45, sma: 25, rma: 5.8, week: 19},
        {smc: 27.4, rmc: 3.8, sma: 25, rma: 5.8, week: 20},
        {smc: 27.2, rmc: 5.3, sma: 25, rma: 6.2, week: 21}
    ])

puts "###TEST Création de backlogs"
    Backlog.create!([
        {mfc: 0.7, mac: 2.2, mb: 172, ob: 80, week: 13},
        {mfc: 0.7, mac: 2.2, mb: 172, ob: 80, week: 14},
        {mfc: 1.2, mac: 2.2, mb: 200, ob: 80, week: 15},
        {mfc: 1.8, mac: 2.2, mb: 96, ob: 80, week: 16},
        {mfc: 2.3, mac: 2.2, mb: 98, ob: 80, week: 17},
        {mfc: 0.4, mac: 2, mb: 153, ob: 80, week: 18},
        {mfc: 0.8, mac: 2, mb: 154, ob: 80, week: 19},
        {mfc: 1.1, mac: 2, mb: 147, ob: 80, week: 20},
        {mfc: 1.7, mac: 1.8, mb: 179, ob: 80, week: 21},
        {mfc: 0.3, mac: 2, mb: 249, ob: 80, week: 22}
    ])