Rails.application.routes.draw do
  resources :ecart_stocks
  resources :analyse_temps_problemes
  resources :taux_expeccs
  resources :taux_expefas
  resources :taux_expes
  resources :rotation_stocks
  # Planning

  get 'event/newish' => 'events#newish'

  resources :calendars
  resources :events, :event_types
  resources :teams
  resources :users

  # Suivi d'activité

  get '/suivi' => 'static#suivi'
  get '/suivi/bugfix' => 'static#bugfix'
  match '/suivi' => 'static#suivi', :via => :post, :defaults => { :format => 'pdf' }

  resources :machines do
    resources :rapports
  end
  resources :backlogs
  resources :stocks

  # Indicateurs

  get 'indicateurs' => 'indicateurs#all'

  get 'indicateurs/production/new' => 'indicateurs#fichiers'
  get 'indicateurs/production' => 'indicateurs#production'
  match 'indicateurs/production/results' => 'indicateurs#prod_results', :via => :post

  get 'indicateurs/data' => 'indicateurs#data'

  resources :equipes do
    resources :personnes
  end

    resources :responsables

  resources :analyses
  resources :objectifs


  root 'static#home'
end
