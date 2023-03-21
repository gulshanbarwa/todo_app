Rails.application.routes.draw do
  root "delta#index"
  get "signup" => "delta#signup"
  post "signup" => "delta#create"
  get "login" => "delta#login"
  post "login" => "delta#attempt_login"
  get "logout" => "delta#logout"
  get "show" => "delta#show"
  get 'data/new', to: 'data#new', as: 'new_data'
  post "data", to: "data#create"
  get "plan" => "data#show"
  get "id" => "current#set_current_user"
  get "display" => "current#show_user_data"
end