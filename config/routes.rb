Rails.application.routes.draw do
  
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

  root 'calendars#index'
end
