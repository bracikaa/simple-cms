Rails.application.routes.draw do

resources :pages do
    member do
      get :delete
  end
end

  resources :sections do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete
    end
  end

  #matching root route
  #root ':subjects(:index)'
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
