Rails.application.routes.draw do
  #get 'arduino_clients/index'

  #get 'arduino_clients/show'

  #get 'arduino_clients/edit'

  #get 'arduino_clients/update'

  #get 'arduino_clients/destoy'

  resources :arduino_clients
  resources :registration_courses
  resources :disciplines
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users, except: [:create]
  resources :cursos
  resources :cameras

  root to: 'welcome#index'

  scope "/cameras/:id/" do
    get "camera_record", to: "cameras#record", as: :camera_record
    get "camera_record_start", to: "cameras#record_start", as: :camera_record_start
    get "camera_record_stop", to: "cameras#record_stop", as: :camera_record_stop
  end

  resources :disciplines do
    get :arduino
  end

  #root 'application#show'

  get 'welcome/index'

  get 'welcome/destroy'

  get 'welcome/edit'

  get 'welcome/show'


# Name it however you want
  post 'create_user' => 'users#create', as: :create_user
  #patch 'users/:id' => 'users#update', as: :update_user

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
