ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "events"
  
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  
  map.resource  :account, :controller => "users"
  map.resources :users
  map.resources :user_sessions
  map.resources :campus
  map.resources :courses
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
