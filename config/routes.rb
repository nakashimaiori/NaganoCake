Rails.application.routes.draw do


  root 'public/products#top'

  devise_for :admin, controllers: {
    sessions:      'admin/admin/sessions',
    passwords:     'admin/admin/passwords',
    registrations: 'admin/admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'public/customers/sessions',
    passwords:     'public/customers/passwords',
    registrations: 'public/customers/registrations'
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
    resources :products, only: [:index, :show]

    resources :cart_items, except: [:new, :edit, :show] do
      collection do
      delete 'destroy_all'
      end
    end

    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#confirm'
    resources :orders, except: [:edit, :destroy]

    resources :deliveries, except: [:new, :show]

    resource :customers, only: [:show, :edit, :update] do
      member do
        get 'cancel'
        patch 'withdraw'
      end
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
