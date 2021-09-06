Rails.application.routes.draw do



  devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions'
  }

  scope module: :public do
    get 'about' => 'homes#about'
    root to: 'homes#top'
    resources :items, only: [:index,:show]
    get 'customers/mypage' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/update' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index,:update,:destroy,:create]
    delete 'cart_items' => 'cart_items#all_destroy'
     get 'orders/thanks' => 'orders#thanks'
    resources :orders
    post 'orders/confirm' => 'orders#confirm'
    resources :deliveries

  end

  get 'admin' => 'admin/homes#index'

  namespace :admin do
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end

  devise_for :customers, :controllers => {
    :registrations => 'public/registrations',
    :sessions => 'public/sessions'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
