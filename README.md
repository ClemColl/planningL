### Configuration requise
 - [Ruby](https://www.ruby-lang.org/fr/documentation/installation/)
 - [Rails 5](http://guides.rubyonrails.org/getting_started.html#installing-rails)
 - SQLite3
 
 ### Installation
 - Exécuter ```bundle``` dans le répertoire du projet
 - Exécuter ```rails db:create``` puis ```rails db:migrate``` dans le répertoire du projet
 
 ### Démarrage
 - Lancer le serveur Rails (```rails s``` dans le répertoire du projet)
 - L'application est accessible depuis ```localhost:3000``` dans votre navigateur
 - Vous serez dirigé vers la page des calendriers. Vous pouvez créer, modifier, supprimer ou accéder à un calendrier
 
 ### En cas de problème lors du démarrage ou de l'accès à l'application
 - Exécuter ```bundle``` dans le répertoire du projet
 - Vérifier qu'il n'y a pas de migration en attente, sinon exécuter ```rails db:migrate``` dans le répertoire du projet
