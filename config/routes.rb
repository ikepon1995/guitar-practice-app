Rails.application.routes.draw do
    # トップページ

  # ユーザー認証機能
  devise_for :users

  # 投稿機能（あとで作成）
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :like, only: [:create, :destroy]
  end

  root "home#index"
end
