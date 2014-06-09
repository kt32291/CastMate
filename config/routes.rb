RoleFinder::Application.routes.draw do

  resources :auditions

  devise_for :users
  root 'pages#marketing_home'
  get 'plays/json' => 'plays#index'
  get 'roles/json' => 'roles#index'
  get 'theatres/json' => 'theatres#index'
  get 'roles/full_json' => 'roles#full_index'
  get 'plays/full_json' => 'plays#full_index'
  get 'theatres/full_json' => 'theatres#full_index'
  get 'plays/json_all' => 'plays#all_index'
  get 'roles/json_for_plays' => 'roles#index_for_plays'
  get 'actors/search' => 'actors#search'
  get 'roles/json_search' => 'roles#search_index'
  get 'submissions/:audition_id' => 'submissions#index'
  get 'callsheets/:audition_id' => 'callsheets#index'


  resources :actors, only: [:show, :index]
  resources :jobs
  resources :submissions, only: [:create, :destroy]
  resources :callsheets, only: [:create, :update, :destroy]
  resources :plays, only: [:show, :index, :create, :update, :destroy]
  resources :roles, only: [:index, :create, :update, :destroy]
  resources :theatres, only: [:index, :create, :update, :destroy]
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
