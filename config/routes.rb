Rails.application.routes.draw do

  # Application home
  get "/",                          to: "home#index",       as: :root

  # User routes
  get "/users",                     to: "users#index",      as: :users
  get "/users/new",                 to: "users#new",        as: :new_user
  post "/users/create",             to: "users#create"
  get "users/:id",                  to: "users#show",       as: :user


  # Sign-in / authenticated user routes
  get "/login",                     to: "sessions#new",     as: :login

  # OAuth routes
  # /auth/:provider triggers the auth action; user is returned to:

  get "/auth/:provider/callback",   to: "sessions#create", as: :connect
  post "/auth/:developer/callback", to: "sessions#create"
  get "/logout",                    to: "sessions#destroy",     as: :logout

  # Vimeo routes
  get '/vimeo/index',               to: "vimeo#index",          as: :vimeo
  get '/vimeo/search',              to: "vimeo#search",         as: :vimeo_search
  get '/vimeo/new',                 to: "vimeo#new",            as: :new_vimeo
  post '/vimeo/create',             to: "vimeo#create",         as: :create_vimeo
  get '/vimeo/update',              to: "vimeo#update"
  patch '/vimeo/edit',              to: "vimeo#edit"
  delete '/vimeo/destroy',          to: "vimeo#destroy"
  get '/vimeo/show',                to: "vimeo#show",           as: :show_vimeo

  # Twitter routes
  get '/twitter/new',               to: 'twitter#new',          as: :new_twitter
  get '/twitter/search',            to: 'twitter#show',         as: :twitter_search
  post '/twitter/:feed_uid',        to: 'twitter#create',       as: :twitter

  #Instagram routes
  get '/instagram/index',           to: "instagram#index",      as: :instagram
  get '/instagram/search',          to: "instagram#search",     as: :instagram_search
  # post '/instagram/search', to: "instagram#search"
  get '/instagram/new',             to: "instagram#new",        as: :new_instagram
  post '/instagram/new',            to: "instagram#create"
  get '/instagram/show',            to: "instagram#show",       as: :show_instagram

  #Github routes
  get '/githubs/new',               to: 'githubs#new',          as: :new_github
  get '/githubs/search',            to: 'githubs#show',         as: :githubs_search
  post '/githubs/',                 to: 'githubs#create',       as: :github
  get '/githubs/feed',              to: 'githubs#feed'

  # Subscription routes
  post 'subscriptions/:feed_uid',    to: 'subscriptions#create', as: :subscription

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
