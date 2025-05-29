Rails.application.routes.draw do
  # ユーザー認証機能
  devise_for :users

  # 投稿機能（あとで作成）
  resources :posts

  # トップページ
  root "home#index"
end
