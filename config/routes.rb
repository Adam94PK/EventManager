Rails.application.routes.draw do

  devise_for :users
  root    'static_pages#index'
  get 'events/followed' => 'events#show_followed'
  get 'events/search' => 'events#search'
  post 'events/search' => 'events#search'
  get 'events/chose_hotels_to_add' => 'events#chose_hotels_to_add'
  post 'events/add_hotel' => 'events#add_hotel'
  get 'hotels/show_followed' => 'hotels#show_followed'
  patch 'pending_contributors/accept' => 'pending_contributors#accept'
  post 'events/category' => 'events#category'
  get 'events/hotels' => 'events#show_events_hotels'

  resources :events do
    patch 'pending_contributors/accept' => 'pending_contributors#accept'
    post 'pending_contributors/create' => 'pending_contributors#create'
    resources :agendas
    resources :guests
    resources :main_pages
  end
  resources :hotels do
    resources :hotel_pictures
  end
 
end
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