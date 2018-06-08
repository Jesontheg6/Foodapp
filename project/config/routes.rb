Rails.application.routes.draw do

  # For details on the DSL savailable within this file, see http://guides.rubyonrails.org/routing.html
root "posts#show"

get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  get "/users/new_password" => "users#forget" , as: :new_password

  post "/users/:id/new_password"=> "users#update"

  get "/users/new_password/email" => 'users#confirm_email' , as: :forget_email

  post "/users/new_password/email" => 'users#confrim_email'

get "/posts/show" => "posts#show" , as: :show


resources :users

resources :sessions
resources :posts



  get "/users/:id/edit" => "users#edit"

get "/login" => "sessions#new" , as: :login

 get "/posts/:id/location" => "posts#show_location", as: :show_location

 get "/post/:id/users" => "post#show_users" , as: :show_user_profile

post "/login" => "sessions#create"

get "/users/:id/edit" => "users#edit"

get "users/post" => "users#post" 

get "/users/new" => "users#new" , as: :sign_up

get "/about" => "users#about" 

 delete "/sign_out" => "sessions#destroy", as: "sign_out"

end
