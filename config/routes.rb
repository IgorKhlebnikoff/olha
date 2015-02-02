Olha::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  match '/auth/:provider/callback' => 'authentications#create', via: [:get, :post]

  namespace :admin do
    root to: 'dashboard#index'
    resources :products do
      resources :variants
    end
    resources :categories, except: [:show]
    resources :assortments, except: [:show]
    resources :colors, only: [:new, :create, :destroy]
    resources :sizes, only: [:new, :create, :destroy]
    resources :currencies, only: [:new, :create, :destroy]
  end

  resources :products, only: [:index, :show] do
    member do
      post 'rate'
    end
    resources :reviews, only: [:index, :new, :create, :destroy]
  end

  resources :profiles, only: [:show, :edit, :update]
  resources :wishes, only: [:index] do
    get :add
    get :remove
  end
  resources :carts
  resources :orders

  resources :searches, only: [:index] do
    collection do
      get :autocomplete
    end
  end

  root to: 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
