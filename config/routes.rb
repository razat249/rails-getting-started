Rails.application.routes.draw do
  get 'welcome/index'

  # Routes and resource for user articles and its related comments.  
  resources :articles do
    resources :comments
  end

  get 'search'  => 'last_fm#search'  
  resources :last_fm

  # Routes and resource for user signin/signup.
  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  resources :users

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
