Rails.application.routes.draw do

  scope module: :public do

    get '/' => 'homes#top'
    get 'about' => 'homes#about', as: 'about'

    resources :items, only: [:index, :show]

    resource :customers, only: [:edit, :update]
    get 'customers/my_page', as: 'my_page'
    get 'customers/confirm', as: 'customer_confirm'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'

    resources :shipping_addresses, except: [:new, :show]

    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm', as: 'order_confirm'
    get 'orders/complete', as: 'complete'

  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
    patch 'orders/:id/order_status' => 'orders#order_status', as: 'order_status'
    patch 'order_items/:id/making_status' => 'order_items#making_status', as: 'making_status'

  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
