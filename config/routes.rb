Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create] #groups_controller.rbにアクション定義してあるので、オンリーオプション使う。
end
