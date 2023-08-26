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

    resources :cart_items, only: [:index, :update, :create, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end

  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show] do
      member do
        patch 'order_status'
      end
    end
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
