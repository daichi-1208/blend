Rails.application.routes.draw do


  root 'home#top'
#ユーザー側ルート
  devise_for :users, controllers: {
    sessions: 'devise/user/sessions',
    passwords: 'devise/user/passwords',
    registrations: 'devise/user/registrations'
  } 

  resources :users
    resources :themes, only: [:index, :show] do
    resources :posts
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
