Rails.application.routes.draw do



  resources :subscribes
  resources :thirdparties
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  resources :users do
    member do
      get :comments,:stars

    end
  end

  resources :projects do
    resources :comments
    resource :stars
  end

  resources :users
  resources :stars
  resources :sessions, only: [:new, :create, :destroy]

  match '/loginReg', to: 'sessions#loginReg', via: 'get'
  match '/signup',  to: 'users#new',via:'get'
  match '/signout', to: 'sessions#destroy',via:'delete'

  match '/github/login', to:'users#github_login', via: 'get'

  match '/projects/date/:date', to:'projects#get_projects_by_time', via: 'get'
  match '/github/access_token', to:'users#github_access_token', via: 'get'
  match '/github/login', to:'users#github_login', via: 'post'
  match '/projects/search', to:'projects#search', via: 'post'
  match '/users/password', to:'users#update_pass', via: 'post'
  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
