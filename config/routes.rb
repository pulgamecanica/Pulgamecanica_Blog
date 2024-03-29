Rails.application.routes.draw do
  #devise
  devise_for :authors

  # Active Analtics
  mount ActiveAnalytics::Engine, at: "analytics"
  
  # Admmin
  resources :authors, only: [:update]
  get 'the_shire',  to: 'authors#index'
  scope module: 'authors' do
    # POSTS
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
    # PROJECTS
    post 'projects/:id/publish', to: 'projects#publish', as: 'publish_project'
    post 'projects/:id/unpublish', to: 'projects#unpublish', as: 'unpublish_project'
    post 'projects/:id/project_tags', to: 'projects#updateTags', as: 'project_tags'
    delete 'projects/:id/project_tags/:tag_id', to: 'projects#removeTag', as: 'remove_project_tags'
    resources :projects,  only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :references, only: [:create, :destroy]
    end
    # PAGES
    resources :pages, only: [:index, :new, :create, :edit, :update, :destroy]

    # TAGS
    resources :tags, only: [:index, :create, :update, :destroy]
  end
  
  # Visitors
  scope module: 'visitors' do
    # POSTS
    root "posts#index"
    get "posts/index"
    get 'posts/:id', to: 'posts#show', as: "posts_show"

    # ERRORS
    match "/404", :to => "errors#not_found", :via => :all
    match "/500", :to => "errors#internal_server_error", :via => :all

    # PROJECTS
    get 'showcase', to: "projects#index"

    #PAGES
    get 'pulga_pages/', to: 'pages#index', as: "pulga_pages_index"
    get 'pulga_pages/:id', to: 'pages#show', as: "pulga_pages_show"

    # TAGS 
    get 'filter_tags', to: 'tags#index', as: 'filter_tags'
    get 'filter_tags/:id', to: 'tags#show', as: 'filter_tag'

  end
end
