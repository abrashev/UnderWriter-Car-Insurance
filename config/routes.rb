Cis::Application.routes.draw do
  resources :quotations, except: [:edit, :update]  do
   get 'search', on: :collection
 end
  resources :users
	resource :session, only: [:new, :create, :destroy,:userlogin]
	match 'login', to: 'sessions#userlogin',via: [:post]
	#	get 'addincident', to: 'users#addincident',via: [:get]
	get 'home', to: 'home#index', as: :home
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
	#resource 'customers', to: 'users#index', as: :users
  # You can have the root of your site routed with "root"
  root 'home#index'
  #match 'get_my_id', to: 'users#get_my_id' ,via: [:post]
  #get 'get_auth', to: 'home#return_auth_token_baby'
  #get 'calc', to: 'quotations#calculatepremium', via: [:get]
match '*a', :to => 'errors#routing', via: [:get]
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
