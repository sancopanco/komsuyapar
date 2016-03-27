Rails.application.routes.draw do



  resources :messages


  root to: "hello#index"

  
  get "/harita" => "hello#map", :as => :map
  get "/yeni_yetenek_point" => "points#new", :as => :add
  get "/nedir" => "hello#about", :as => :about

  match "/auth/:provider/callback" => "sessions#create",via: [:get, :post]
  post "/sign-out" => "sessions#destroy", :as => :sign_out

  get "/lokasyon(.:format)" => "points#index", :as => :points
  post "/lokasyon(.:format)" => "points#create"
  get "/lokasyon/:id(.:format)" => "points#show", :as => :point
  post "/report(.:format)" => "points#report"

  get '/users(.:format)' => "users#index", :as => :users
  get '/bildirimler' => 'messages#index' 

  get '/auto_complete' => 'visitors#auto_complete', :as=> :auto_complete
  get '/instant_search' => 'visitors#instant_search', :as=> :instant_search
  get '/instant_search_wiget' => 'visitors#instant_search_wiget', :as=> :instant_search_wiget
  get '/geo_search' => 'visitors#geo_search', :as=> :geo_search
  match "/backend-search" => 'search#index', via: [:post, :get], as: :backend_search


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
