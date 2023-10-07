Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "issues#index"
  get "dashboard", to: "pages#dashboard"

  resources :issues, only: [:new, :create, :show] do
    resources :bookmarks, only: :create do
      collection do
        delete :destroy
      end
    end
    resources :comments, only: :create
  end
end
