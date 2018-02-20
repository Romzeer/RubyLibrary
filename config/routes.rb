Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :auteurs

  get 'welcome/index'

  get 'books/blog'

  get '/pages/:page' => 'pages#show'

  get 'books/search' => 'books#search'

  get 'admin' => 'books#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books do
    resources :comments
  end

  root 'welcome#index'
end
