Rails.application.routes.draw do
  resources :transactions
  resources :users
  post '/login', to:"index#login"
  get '/login', to: "index#login"
  post '/register', to: "index#register"
  get '/register', to: "index#register"
  get 'index/index', to: "index#index"
  get '/about', to: "index#about"
  get '/', to: "index#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
