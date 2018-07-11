# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


---
event_fields:
  columns:
  - id
  - name
  - field_type
  - required
  - event_type_id
  - created_at
  - updated_at
  records: 
  - - 1
    - Métier
    - texte
    - false
    - 1
    - '2018-06-21 12:30:03.863226'
    - '2018-06-21 12:30:03.863226'
  - - 2
    - Gamme
    - gamme
    - false
    - 1
    - '2018-06-21 12:30:03.865443'
    - '2018-06-21 12:30:03.865443'
  - - 3
    - Largeur chassis
    - largeur_chassis
    - false
    - 1
    - '2018-06-21 12:30:03.867317'
    - '2018-06-21 12:30:03.867317'
  - - 4
    - ATO
    - sous_ensemble
    - false
    - 1
    - '2018-06-21 12:30:03.869159'
    - '2018-06-21 12:30:03.869159'
  - - 5
    - Lattes
    - sous_ensemble
    - false
    - 1
    - '2018-06-21 12:30:03.871104'
    - '2018-06-21 12:30:03.871104'
  - - 6
    - Turbine
    - sous_ensemble
    - false
    - 1
    - '2018-06-21 12:30:03.873050'
    - '2018-06-21 12:30:03.873050'
  - - 7
    - EM
    - sous_ensemble
    - false
    - 1
    - '2018-06-21 12:30:03.875524'
    - '2018-06-21 12:30:03.875524'
  - - 8
    - CODA
    - sous_ensemble
    - false
    - 1
    - '2018-06-21 12:30:03.877502'
    - '2018-06-21 12:30:03.877502'
  - - 9
    - Métier
    - texte
    - false
    - 2
    - '2018-06-21 12:30:03.879369'
    - '2018-06-21 12:30:03.879369'
  - - 10
    - Gamme
    - gamme
    - false
    - 2
    - '2018-06-21 12:30:03.881181'
    - '2018-06-21 12:30:03.881181'
  - - 11
    - Largeur chassis
    - largeur_chassis
    - false
    - 2
    - '2018-06-21 12:30:03.883006'
    - '2018-06-21 12:30:03.883006'
  - - 12
    - Date
    - date
    - false
    - 2
    - '2018-06-21 12:30:03.884800'
    - '2018-06-21 12:30:03.884800'
  - - 13
    - Pièce
    - texte
    - false
    - 2
    - '2018-06-21 12:30:03.886725'
    - '2018-06-21 12:30:03.886725'
  - - 14
    - Notes
    - texte
    - false
    - 2
    - '2018-06-21 12:30:03.888543'
    - '2018-06-21 12:30:03.888543'
  - - 15
    - Métier
    - texte
    - false
    - 3
    - '2018-06-21 12:30:03.890630'
    - '2018-06-21 12:30:03.890630'
  - - 16
    - Gamme
    - gamme
    - false
    - 3
    - '2018-06-21 12:30:03.898112'
    - '2018-06-21 12:30:03.898112'
  - - 17
    - Découpeur
    - sous_ensemble
    - false
    - 3
    - '2018-06-21 12:30:03.900569'
    - '2018-06-21 12:30:03.900569'
  - - 18
    - Lattes
    - sous_ensemble
    - false
    - 3
    - '2018-06-21 12:30:03.902394'
    - '2018-06-21 12:30:03.902394'
  - - 19
    - Caisson Aspi
    - sous_ensemble
    - false
    - 3
    - '2018-06-21 12:30:03.904181'
    - '2018-06-21 12:30:03.904181'
  - - 20
    - EM
    - sous_ensemble
    - false
    - 3
    - '2018-06-21 12:30:03.905988'
    - '2018-06-21 12:30:03.905988'
  - - 21
    - CODA
    - sous_ensemble
    - false
    - 3
    - '2018-06-21 12:30:03.907948'
    - '2018-06-21 12:30:03.907948'
  - - 22
    - Métier
    - texte
    - false
    - 4
    - '2018-06-21 12:30:03.909756'
    - '2018-06-21 12:30:03.909756'
  - - 23
    - Gamme
    - gamme
    - false
    - 4
    - '2018-06-21 12:30:03.911656'
    - '2018-06-21 12:30:03.911656'
  - - 24
    - Date
    - date
    - false
    - 4
    - '2018-06-21 12:30:03.913614'
    - '2018-06-21 12:30:03.913614'
  - - 25
    - Pièce
    - texte
    - false
    - 4
    - '2018-06-21 12:30:03.915491'
    - '2018-06-21 12:30:03.915491'
  - - 26
    - Notes
    - texte
    - false
    - 4
    - '2018-06-21 12:30:03.917336'
    - '2018-06-21 12:30:03.917336'
  - - 27
    - Pièce
    - texte
    - false
    - 5
    - '2018-06-21 12:30:03.919249'
    - '2018-06-21 12:30:03.919249'
  - - 28
    - Notes
    - texte
    - false
    - 5
    - '2018-06-21 12:30:03.921869'
    - '2018-06-21 12:30:03.921869'

---
EventTypes.create!(
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
)