Rails.application.routes.draw do
  resources :spend_categories

  # user_incomes routes
  get 'user_income/index'
  post 'user_income/create'
  get 'user_income/new'
  delete 'user_income/destroy/:id' => 'user_income#destroy' , as: 'user_income_destroy'
  get 'user_income/show'

  resource :spend_category_user, only: [:update, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :users, only: [:none] do
    resources :password_resets, only: [:edit, :update]
  end
  resources :password_resets, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get  'application/logout'
end
