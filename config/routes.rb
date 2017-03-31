Rails.application.routes.draw do
  
  #matching root route
  root 'demo#index'	

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/google'
  #match "demo/index", :to "demo#index", :via => :get

  #default route
  #get ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
