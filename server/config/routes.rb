Rails.application.routes.draw do
  resources :users, only: [ :create ] do
    collection do
      post 'sign_in'
      get 'me'
    end
  end
  resources :memos
  post 'login/login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
