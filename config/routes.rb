Rails.application.routes.draw do
    # トップページ

  # ユーザー認証機能
  devise_for :users

  
  resources :posts

  root "home#index"
end
