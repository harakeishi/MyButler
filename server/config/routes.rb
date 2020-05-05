Rails.application.routes.draw do
  get 'login/login'
  resources :users
  resources :memos
  post 'login/login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
