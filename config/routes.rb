Rails.application.routes.draw do
  get 'follower/create'

  root 'static_pages#index'
  devise_for :users
  patch 'events', to: 'events#index'
  match 'events/search', to: 'events#search', via: [:get, :post]
  get 'events/followed', to: 'events#show_followed'
  get 'events/created', to: 'events#show_created'
  post 'events/category', to: 'events#category'
  resources :events do
    post 'publish', to: 'events#publish'
    post 'unpublish', to: 'events#unpublish'
    get 'guests', to: 'events#event_guests'
    get 'choose_hotels_to_add', to: 'events#choose_hotels_to_add'
    get 'choose_hotels_to_delete', to: 'events#choose_hotels_to_delete'
    put 'add_hotel', to: 'events#add_hotel'
    put 'delete_hotel', to: 'events#delete_hotel'
    get 'hotels', to: 'events#show_event_hotels'
    post 'pending_contributors/accept', to: 'pending_contributors#accept'
    post 'pending_contributors/create', to: 'pending_contributors#create'
    delete 'pending_contributors/delete', to: 'pending_contributors#destroy'
    resources :agendas, except: [:index]
    resources :guests, only: [:create, :new]
    resources :main_pages, except: [:index]
    resources :comments
  end
  put 'followers/create', to: 'followers#create'
  delete 'followers/destroy', to: 'followers#destroy'
  get 'hotels_show_followed', to: 'hotels#show_followed'
  patch 'hotels', to: 'hotels#search'
  resources :hotels do
    resources :hotel_pictures, only: [:create, :destroy]
  end
  get 'admin', to: 'admin_panel#index'
  get 'admin/user_list', to: 'admin_panel#user_list'
  get 'admin/user_content', to: 'admin_panel#user_content'
  resources :users do
    get 'users', to: 'users#show'
    put 'ban', to: 'users#ban'
    put 'unban', to: 'users#unban'
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
