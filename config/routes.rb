Rails.application.routes.draw do
  root to: 'decks#index'
  devise_for :users, controllers: {sessions: "users/sessions"}
  resources :decks do
    resources :cards
  end

end
