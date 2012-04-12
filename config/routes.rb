Epatterns::Application.routes.draw do
  resources :line_works

  resources :portfolios

  get "market/index"

  resources :patterns
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  root :to => 'market#index', :as => 'market'
end
