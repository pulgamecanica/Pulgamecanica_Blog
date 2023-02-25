Rails.application.routes.draw do
  devise_for :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  mount ActiveAnalytics::Engine, at: "analytics"
  
  scope module: 'visitors' do
    root "posts#index"
    get 'home/about'
    get 'home/cv'
    get 'posts/index'
    get 'posts/:id', to: 'posts#show', as: "posts_show"  
  end

  get 'the_shire',  to: 'authors#index'

  scope module: 'authors' do
    post 'posts/:id/sort_elements', to: 'posts#sort_elements'
    post 'posts/:id/publish', to: 'posts#publish', as: 'publish_post'
    post 'posts/:id/unpublish', to: 'posts#unpublish', as: 'unpublish_post'
    post 'posts/:id/post_tags', to: 'posts#updateTags', as: 'post_tags'
    delete 'posts/:id/post_tags/:tag_id', to: 'posts#removeTag', as: 'remove_post_tags'
    resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :elements, only: [:create, :update, :destroy] do
        resources :title, only: [:update]
      end
      # resources :post_tags, only: [:create, :destroy] do
      # end
    end
    
    resources :tags, only: [:index, :create, :update, :destroy] do

    end
  end
end
