Rails.application.routes.draw do
  
  get 'indicateurs/all'

  get 'indicateurs/production'

  get 'indicateurs/suivi'

  resources :analyses
  resources :objectifs
  resources :responsables
  resources :backlogs
  resources :stocks
  resources :machines do
    resources :rapports
  end

  get 'static/home'
  get '/suivi' => "static#suivi"

  get '/indicateurs' => 'static#indicateurs'
  match "/suivi" => "static#suivi", :via => :post, :defaults => { :format => 'pdf' }

  resources :event_types
  resources :teams
  resources :users
  resources :calendars
  resources :events
    get "event/newish" => "events#newish"
    get '/fichiers' => 'static#fichiers'
    match '/eff_util' => "static#eff_util", :via => :post
  root 'calendars#index'
end
