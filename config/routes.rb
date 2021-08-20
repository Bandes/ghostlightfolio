Rails.application.routes.draw do
  get 'contacts/index'

  authenticate :user, lambda { |u| u.admin? } do
    mount Trestle::Engine => '/admin'
  end

  devise_for :users
  root to: 'home#index'

  resources :people, only: %w[index new create update destroy edit]
  resources :locations, only: %w[index new create update destroy edit]
  resources :shows, only: %w[index new create update destroy edit show] do
    resources :roles, only: %w[edit update new create destroy]
  end
  get 'shows/new_from_author/:author_id', to: 'shows#new_from_author'

  resources :authors, only: %w[index new create update destroy edit show]
  resources :contacts, only: %w[index create]
  resources :abouts, only: :index
end
