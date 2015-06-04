Rails.application.routes.draw do

  root to: 'sessions#index'
  get 'login',to:'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout' ,to: 'sessions#destroy'

  get 'signup',to: 'users#new'
  post 'signup',to:'users#create'

  resources :decks do
    resources :cards
  end

end
