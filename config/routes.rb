Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  get '/' => 'users#index' 
  post'/sessions' => 'sessions#index'
  post '/users' => 'users#create'
  
  get '/posts/topposts' => 'posts#topposts'
  # Defines the root path route ("/")
  put '/posts/19/edit' => 'posts#edit'
  resources :posts
   
end
