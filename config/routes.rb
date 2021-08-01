require 'sidekiq/web'

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  root to: 'home#index'

  resources :people, only: %w[index new create update destroy edit]
  resources :locations, only: %w[index new create update destroy edit]
  resources :shows, only: %w[index new create update destroy edit]
  resources :authors, only: %w[index new create update destroy edit]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
