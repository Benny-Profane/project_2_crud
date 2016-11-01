Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :users do
    resources :posts do
      resources :comments
    end
  end

   resources :post_votes, only: [:create, :destroy]
   resources :comment_votes, only: [:create, :destroy]
   resources :sessions, only: [:new, :create, :destroy]

   # Create a better looking URL for logging in
   get '/login', to: 'sessions#new'
   # Create better URL for logging out
   get '/logout', to: 'sessions#destroy'
   # Create account
   get '/signup', to: 'users#new'
end

