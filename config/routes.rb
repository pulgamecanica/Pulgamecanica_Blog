Rails.application.routes.draw do
  
  devise_for :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope module: 'authors' do
    resources :posts, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :elements, only: [:create, :update, :destroy]
    end
  end
end
