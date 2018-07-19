Rails.application.routes.draw do
  #Planning

  get "event/newish" => "events#newish"

  resources :calendars
  resources :events, :event_types
  resources :teams
  resources :users

  #Suivi d'activité

  get '/suivi' => "static#suivi"
  get '/suivi/bugfix' => "static#bugfix"
  match "/suivi" => "static#suivi", :via => :post, :defaults => { :format => 'pdf' }

  resources :machines do
    resources :rapports
  end
  resources :backlogs
  resources :stocks

  #Indicateurs

  get 'indicateurs' => 'indicateurs#all'

  get 'indicateurs/production/new' => 'indicateurs#fichiers'
  match 'indicateurs/production/results' => "indicateurs#prod_results", :via => :post
  
  resources :equipes do
    resources :personnes
  end

    resources :responsables

  resources :analyses
  resources :objectifs

  
  root 'calendars#index'

end
