Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  delete "/delete/:id" => "movies#destroy" , as: :delete_movie

  get "/show/:id" => "movies#show" , as: :show_movie
  post "/review/:id" => "reviews#create" , as: :review_movie

  get "/list/index" => "lists#index" , as: :my_list
  post "/list/create" => "lists#create" , as: :create_list
  post "/list/add/:movie_id" => "lists#add" , as: :add_to_list

  get "/edit/:id" => "movies#edit" , as: :edit_movie
  patch "/update/:id" => "movies#update" , as: :update_movie

  get "/about" => "movies#about", as: :about_us

  get "/add" => "movies#add" , as: :add_movie
  post "/add" => "movies#create" , as: :create_movie

  root "movies#index"

  

  # Defines the root path route ("/")
  # root "posts#index"
end
