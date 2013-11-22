Healthmaze::Application.routes.draw do
  
  get 'home' => 'maze#home'
  get 'options' => 'maze#get_options'
  patch 'options' => 'maze#set_options'
  get 'needs' => 'maze#get_needs'
  patch 'needs' => 'maze#set_needs'
  get 'plans' => 'plans#index'
  get 'plans/:id' => 'plans#show'
  get 'plans/compare' => 'plans#compare'

  root 'maze#home'

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
