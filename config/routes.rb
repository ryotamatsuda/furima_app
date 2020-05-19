Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }, skip: :all
  devise_scope :admin do
    get '/admins/sign_in' => 'admins/sessions#new', as: 'new_admin__session'
    post '/admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete '/admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  namespace :admins do
    resources :untraded_products, only: [:index, :edit, :update, :destroy]
    get '/trading_products' => 'traded_products#trading_product_index'
    get '/traded_products' => 'traded_products#traded_product_index'
    resources :traded_products, only: [:edit, :update, :destroy]
    resources :end_users, only: [:index, :edit, :update, :destroy]
  end

  devise_for :end_users, controllers: {
    registrations: 'publics/registrations',
    sessions: 'publics/sessions',
    confirmations: 'publics/confirmations',
    passwords: 'publics/passwords'
  }, skip: :all
  devise_scope :end_user do
    get '/end_users/sign_up' => 'publics/registrations#new', as: 'new_end_user_registration'
    post '/end_users' => 'publics/registrations#create', as: 'create_end_user_registration'
    get '/end_users/edit' => 'publics/registrations#edit', as: 'edit_end_user_registration'
    patch '/end_users' => 'publics/registrations#update', as: 'update_end_user_registration'
    get '/end_users/sign_in' => 'publics/sessions#new', as: 'new_end_user_session'
    post '/end_users/sign_in' => 'publics/sessions#create', as: 'end_user_session'
    delete '/end_users/sign_out' => 'publics/sessions#destroy', as: 'destroy_end_user_session'
    get '/end_users/password/new' => 'publics/passwords#new', as: 'new_end_user_password'
    post '/end_users/password' => 'publics/passwords#create', as: 'end_user_password'
    get '/end_users/confirmation/new' => 'publics/confirmations#new', as: 'new_end_user_confirmation'
    get '/end_users/confirmation' => 'publics/confirmations#show', as: 'end_user_confirmation'
    post '/end_users/confirmation' => 'publics/confirmations#create', as: 'create_end_user_confirmation'
  end
  scope module: :publics do
    root to: 'homes#top'
    resources :contacts, only: [:new, :create]
    resource :products do
      get '/my_selling_products' => 'products#my_selling_products'
      get '/:id/buy_confirmation' => 'products#buy_confirmation'
      post '/:id/buy' => 'products#buy'
      get '/buy_completed' => 'products#buy_completed'
    end
    resources :products
    resource :traded_products do
      get '/buy_index' => 'traded_products#buy_index'
      patch '/:id/receipt_confirmation' => 'traded_products#receipt_confirmation'
      get '/trade_completed' => 'traded_products#trade_completed'
      get '/trade_completed_buy_index' => 'traded_products#trade_completed_buy_index'
      get '/sell_index' => 'traded_products#sell_index'
      patch '/:id/ship_completed' => 'traded_products#ship_completed'
      get '/trade_completed_sell_index' => 'traded_products#trade_completed_sell_index'
    end
    resources :traded_products, only: [:show]
  end
end
