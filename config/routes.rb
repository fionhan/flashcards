Rails.application.routes.draw do
  root to: 'decks#index'
  devise_for :users
  resources :decks do
    resources :cards
  end

end
