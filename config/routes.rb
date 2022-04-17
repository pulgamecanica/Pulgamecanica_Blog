Rails.application.routes.draw do

  devise_for :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  scope module: 'visitors' do
    root "posts#index"
    get 'posts/index'
    get 'posts/:id/show', to: 'posts#show', as: "posts_show"
  end

  scope module: 'authors' do
    post 'posts/:id/publish', to: 'posts#publish'
    post 'posts/:id/unpublish', to: 'posts#unpublish'
    resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :elements, only: [:create, :update, :destroy]
    end
  end
end
