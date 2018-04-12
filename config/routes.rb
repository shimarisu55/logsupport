Rails.application.routes.draw do
  get 'ajax/index'

  # get 'group_users/show'

  get 'group_users/index'
  root 'blogs#index'

  get 'group_users/search'  =>  'group_users#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :index, :update, :destroy] do
    resources :blogs, only:[:index]
    resources :favorites, only:[:index]
  end
  resources :blogs do
    resource :favorites, only: [:create, :destroy, :show]
  	resource :post_comments, only: [:create, :destroy]
   # match 'result',to: 'blogs#edit', via:[:get,:post]
  end
  resources :groups do
    resources :group_users, only: [:index, :show, :create, :update, :destroy]
  end
end
