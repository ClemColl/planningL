# Planning
Calendar.create([
    {title: 'Vector montage'},
    {title: 'Versalis'},
    {title: 'Vector test'}
])

EventType.create([
    {id: 1, name: 'Montage Vector Gros Cutter', duree: "2.5"},
    {id: 2, name: 'Test Vector Gros Cutter', duree: "4"},
    {id: 3, name: 'Montage Vector Petit Cutter', duree: "2"},
    {id: 4, name: 'Test Vector Petit Cutter', duree: "4"},
    {id: 5, name: 'Versalis', duree: "2"},
    {id: 6, name: 'Carte Classique', duree: "2"}
])

EventField.create([
    {name: "Métier", field_type: "texte", required: nil, event_type_id: 1},
    {name: "Gamme", field_type: "gamme_GC", required: nil, event_type_id: 1},
    {name: "Largeur chassis", field_type: "largeur_chassis_GC", required: nil, event_type_id: 1},
    {name: "ATO", field_type: "sous_ensemble", required: nil, event_type_id: 1},
    {name: "Lattes", field_type: "sous_ensemble", required: nil, event_type_id: 1},
    {name: "Turbine", field_type: "sous_ensemble", required: nil, event_type_id: 1},
    {name: "EM", field_type: "sous_ensemble", required: nil, event_type_id: 1},
    {name: "CODA", field_type: "sous_ensemble", required: nil, event_type_id: 1},
    {name: "Texte", field_type: "texte", required: nil, event_type_id: 1},

    {name: "Métier", field_type: "texte", required: nil, event_type_id: 2},
    {name: "Gamme", field_type: "gamme_GC", required: nil, event_type_id: 2},
    {name: "Largeur chassis", field_type: "largeur_chassis_GC", required: nil, event_type_id: 2},
    {name: "ANT", field_type: "ant", required: nil, event_type_id: 2},
    {name: "Convoyeur", field_type: "texte", required: nil, event_type_id: 2},
    {name: "Tête", field_type: "texte", required: nil, event_type_id: 2},
    {name: "Expe", field_type: "texte", required: nil, event_type_id: 2},
    {name: "Texte", field_type: "texte", required: nil, event_type_id: 2},

    {name: "Métier", field_type: "texte", required: nil, event_type_id: 3},
    {name: "Gamme", field_type: "gamme_PC", required: nil, event_type_id: 3},
    {name: "Largeur chassis", field_type: "largeur_chassis_PC", required: nil, event_type_id: 3},
    {name: "Découpeur", field_type: "sous_ensemble", required: nil, event_type_id: 3},
    {name: "Lattes", field_type: "sous_ensemble", required: nil, event_type_id: 3},
    {name: "Caisson Aspi", field_type: "sous_ensemble", required: nil, event_type_id: 3},
    {name: "EM", field_type: "sous_ensemble", required: nil, event_type_id: 3},
    {name: "CODA", field_type: "sous_ensemble", required: nil, event_type_id: 3},
    {name: "Texte", field_type: "texte", required: nil, event_type_id: 3},

    {name: "Métier", field_type: "texte", required: nil, event_type_id: 4},
    {name: "Gamme", field_type: "gamme_PC", required: nil, event_type_id: 4},
    {name: "Largeur chassis", field_type: "largeur_chassis_PC", required: nil, event_type_id: 4},
    {name: "ANT", field_type: "ant", required: nil, event_type_id: 4},
    {name: "Convoyeur", field_type: "texte", required: nil, event_type_id: 4},
    {name: "Tête", field_type: "texte", required: nil, event_type_id: 4},
    {name: "ATO", field_type: "sous_ensemble", required: nil, event_type_id: 4},
    {name: "Expe", field_type: "texte", required: nil, event_type_id: 4},
    {name: "Texte", field_type: "texte", required: nil, event_type_id: 4},

    {name: "Pièce", field_type: "texte", required: nil, event_type_id: 5},
    {name: "Description", field_type: "texte", required: nil, event_type_id: 5},
    {name: "Couleur", field_type: "couleur", required: nil, event_type_id: 5},

    {name: "Description", field_type: "texte", required: nil, event_type_id: 6},
    {name: "Couleur", field_type: "couleur", required: nil, event_type_id: 6}
])

# Suivi d'activité
Machine.create([
    {id: 1, name: "Gros Vector"},
    {id: 2, name: "Petit Vector"},
    {id: 3, name: "Versalis"},
    {id: 4, name: "Focus Quantum"},
    {id: 5, name: "Virga"}
])

# Indicateurs FAB
Equipe.create([
    {id: 1, re: "Fab"},
    {id: 2, re: "J.Allain"},
    {id: 3, re: "L.Arlot"},
    {id: 4, re: "S.Bourreau"},
    {id: 5, re: "N.Doriguzzi"},
    {id: 6, re: "L.Dubois"}
])

Objectif.create([
    {name: 'Efficacité', value: 100},
    {name: 'Utilisation', value: 100}
])

Personne.create([
    {name: "ARLOT, JEREMY", equipe_id: 2},
    {name: "BOURGOIN, AMANDINE", equipe_id: 2},
    {name: "BROSSON, LIONEL", equipe_id: 2},
    {name: "DUPRAT, MATHIEU", equipe_id: 2},
    {name: "FURET, THOMAS", equipe_id: 2},
    {name: "GAY, JULIE", equipe_id: 2},
    {name: "HUYOT, SANDRA", equipe_id: 2},
    {name: "LACOUR, MICHAEL", equipe_id: 2},
    {name: "LEROY, DAMIEN", equipe_id: 2},
    {name: "MAILLOT, JEAN", equipe_id: 2},
    {name: "PEIRO, AITOR", equipe_id: 2},
    {name: "PORCHER, Laurent", equipe_id: 2},
    {name: "TIKHERBATINE, NADY", equipe_id: 2},

    {name: "BEYRIS, FRANCK", equipe_id: 3},
    {name: "BLANCHET, ALAIN", equipe_id: 3},
    {name: "BONSON, PIERRE JACQUES", equipe_id: 3},
    {name: "GILBERT, ALEXANDRE", equipe_id: 3},
    {name: "HORNN, CHRISTIAN", equipe_id: 3},
    {name: "JUSTON, KEVIN", equipe_id: 3},
    {name: "MISCHLER, GERMAIN", equipe_id: 3},
    {name: "PODEUR, GUILLAUME", equipe_id: 3},
    {name: "SERCAN, THIERRY", equipe_id: 3},
    {name: "VILLEY, PATRICE", equipe_id: 3},

    {name: "ANDRADE, JOSE", equipe_id: 4},
    {name: "ARRAUZAU, ERIC", equipe_id: 4},
    {name: "AUBERGER, NATHALIE", equipe_id: 4},
    {name: "BANSERET, HENRI", equipe_id: 4},
    {name: "BOULIERE, MARC", equipe_id: 4},
    {name: "DIVIER, ALEXANDRE", equipe_id: 4},
    {name: "DUFFAIT, FLORIAN", equipe_id: 4},
    {name: "FY, SEBASTIEN", equipe_id: 4},
    {name: "GIL, VICTOR", equipe_id: 4},
    {name: "GIRARD, DORIAN", equipe_id: 4},
    {name: "GUICHARD-DIOT, CAROLE", equipe_id: 4},
    {name: "GUINARD, PIERRE", equipe_id: 4},
    {name: "MAGNON, ERIC", equipe_id: 4},
    {name: "MOREAU, GILLES", equipe_id: 4},
    {name: "MOURET, JEAN-JACQUES", equipe_id: 4},
    {name: "PITON, DAMIEN", equipe_id: 4},

    {name: "CHEVALIER, QUENTIN", equipe_id: 5},
    {name: "DESERT, LAURENT", equipe_id: 5},
    {name: "DUBO, MICHEL", equipe_id: 5},
    {name: "DUPHIL, PASCAL", equipe_id: 5},
    {name: "EGRETAUD, BERTRAND", equipe_id: 5},
    {name: "EL MOUKH, MILOUD", equipe_id: 5},
    {name: "GONZALEZ, THOMAS", equipe_id: 5},
    {name: "GROJSMAN, MATTHIEU", equipe_id: 5},
    {name: "LARRIBAU, XAVIER", equipe_id: 5},
    {name: "PICQUET, FABRICE", equipe_id: 5},
    {name: "RATSIRAHONANA, ERIC", equipe_id: 5},
    {name: "WOJCIECHOWSKI, PIERRE", equipe_id: 5},

    {name: "BELLUGUE, JEAN-FRANCOIS", equipe_id: 6},
    {name: "BORDON, THIERRY", equipe_id: 6},
    {name: "BOURG, FRANCK", equipe_id: 6},
    {name: "CALLET, JACQUES", equipe_id: 6},
    {name: "DUCEPT, MATTHIEU", equipe_id: 6},
    {name: "HELMER, JEAN-LUC", equipe_id: 6},
    {name: "HENNINOT, LUC", equipe_id: 6},
    {name: "JAILLET, FABIEN", equipe_id: 6},
    {name: "LEMARCHAND, JEAN-FRANTZ", equipe_id: 6},
    {name: "MONLEZUN, DOMINIQUE", equipe_id: 6},
    {name: "PONCIN, ALEXANDRE", equipe_id: 6},
    {name: "REBEYROTTE, LAURENT", equipe_id: 6},
    {name: "RECART, ARNAUD", equipe_id: 6},
    {name: "TILLOS, ARNAUD", equipe_id: 6}
])