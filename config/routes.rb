Rails.application.routes.draw do


  #get 'relationships/create'
  #get 'relationships/destroy'
  #get 'favorites/create'
  #get 'favorites/destroy'
  root 'home#top'
#ユーザー側ルート
  devise_for :users, controllers: {
    sessions: 'devise/user/sessions',
    passwords: 'devise/user/passwords',
    registrations: 'devise/user/registrations'
  } 

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
    
  resources :themes, only: [:index, :show] do
    resources :posts, except: [:edit] do
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
  end


#ここまで
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
