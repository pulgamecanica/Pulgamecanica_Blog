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
    post 'posts/:id/sort_elements', to: 'posts#sort_elements'
    post 'posts/:id/publish', to: 'posts#publish', as: 'publish_post'
    post 'posts/:id/unpublish', to: 'posts#unpublish', as: 'unpublish_post'
    resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :elements, only: [:create, :update, :destroy] do
        resources :title, only: [:update]
      end
    end
  end
end
