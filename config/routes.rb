Rails.application.routes.draw do
  devise_for :users
  root to: "issues#index"
  get "dashboard", to: "pages#dashboard"


  resources :issues, only: [:new, :create, :show] do
    resources :bookmarks, only: :create
  end

  resources :bookmarks, only: :destroy
  resources :comments, only: :create

end
