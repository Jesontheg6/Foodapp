Rails.application.routes.draw do

  # For details on the DSL savailable within this file, see http://guides.rubyonrails.org/routing.html
root "users#new"

get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  get "/users/new_password" => "users#forget" , as: :new_password

  post "/users/:id/new_password"=> "users#update"

  get "/users/new_password/email" => 'users#confirm_email' , as: :forget_email

  post "/users/new_password/email" => 'users#confrim_email'


resources :users
resources :sessions


  get "/users/:id/edit" => "users#edit"

get "/login" => "sessions#new" , as: :login

post "/login" => "sessions#create"

get "/feed" => "users#feed" , as: :feed

get "/users/:id/edit" => "users#edit"


get "/users/new" => "users#new" , as: :sign_up

get "/about" => "users#about" 

 delete "/sign_out" => "sessions#destroy", as: "sign_out"

end
