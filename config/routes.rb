ActionController::Routing::Routes.draw do |map|
  map.resources :study_periods

  map.resources :modalities

  map.resources :classes

  map.resources :cursus

  map.resources :cursuses

  map.resources :cursus

  map.resource :manage
  
  map.root :controller => "events"
  
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.event_new_university '/event_new_university', :controller => 'events', :action => 'event_new_university'
  
  map.resource  :account, :controller => "users"
  map.resources :users
  map.resources :user_sessions
  map.resources :campus
  map.resources :courses
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
