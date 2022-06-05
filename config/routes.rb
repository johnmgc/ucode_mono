Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :comments
  resources :publishes do
    collection do
      post 'likes/:id', to: 'publishes#likes_publish', as: :likes
    end
  end
  # devise_for :users, :controllers => { registrations: 'registrations' }
  

  root to: 'publishes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
