Rails.application.routes.draw do

  root 'home#top'
  get "/home/about", to:'home#about'
#ユーザー側ルート
  devise_for :users, controllers: {
    sessions: 'devise/user/sessions',
    passwords: 'devise/user/passwords',
    registrations: 'devise/user/registrations'
  } 

  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
    
  resources :themes, only: [:index, :show] do
    resources :posts, except: [:edit, :update] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end
#ここまで

#管理者側ルート
  devise_for :admins, controllers: {
    sessions: 'devise/admin/sessions',
    passwords: 'devise/admin/passwords',
    registrations: 'devise/admin/registrations'
  }

  namespace :admin do
    root 'home#top'
    resources :themes, except: [:destroy]
    resources :users
    resources :posts, only: [:index, :show, :destroy]
  end
#ここまで
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
