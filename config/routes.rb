Rails.application.routes.draw do

  namespace :public do
    get 'customers/show'
  end
  namespace :public do
    get 'deliveries/index'
  end
  namespace :public do
    get 'orders/index'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'products/show'
    get 'products/index'
  end
  namespace :admin do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/index'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'products/new'
    get 'products/show'
    get 'products/edit'
    get 'products/index'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'genres/show'
  end
  root 'public/products#top'

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  #admins
  namespace :admin do
    get '/' => 'homes#top'
    resources :products, except: :destroy
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, except: [:new, :create, :edit, :destroy]
    resources :order_items, only: :update
  end

  #customers
  namespace :public do
    get '/about' => 'products#about'
    resources :product, only: [:index, :show]

    resources :cart_items, except: [:new, :edit, :show]
    delete 'cart_items/detroy_all' => 'cart_items#destroy_all'

    resources :orders, except: [:edit, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'

    resource :customers, only: [:show, :edit, :update]
    get 'customers/cancel' => 'customers#cansel'
    patch 'customers/withdraw' => 'cusotmers#withdraw'

    resources :deliveries, except: [:new, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
