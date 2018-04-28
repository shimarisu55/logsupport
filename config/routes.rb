Rails.application.routes.draw do
  get 'how_to/index'

  get 'how_to/show'

  get 'group_users/index'
  root 'how_to#show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :index, :update, :destroy] do
    resources :blogs, only:[:index]
    resources :favorites, only:[:index]
    
  end

  resources :blogs do
    collection do
      post 'confirm'
      post :new, path: :new, as: :new, action: :back
    end
    resource :favorites, only: [:create, :destroy, :show]
  	resource :post_comments, only: [:create, :destroy]
   # match 'result',to: 'blogs#edit', via:[:get,:post]
  end

  resources :groups do
    resources :group_users, only: [:index, :show, :create, :update, :destroy]
  end


end
