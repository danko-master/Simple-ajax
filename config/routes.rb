TestApp2::Application.routes.draw do
  
  root :to => "adverts#index"
  

      devise_for :users, :skip => [:registrations] 
        as :user do
          post "/users" => "devise/registrations#create", :as => :user_registration
          get "/users" => "devise/registrations#new", :as => :new_user_registration
          get "/users/edit" => "registrations#edit", :as => :edit_user_registration
          put "/users" => "registrations#update"
          put "/users/set_area_by_city" => "registrations#set_area_by_city", :as => :set_area_by_city_user_registration
          
          #### ajax methods for load area, city
          put "/users/get_cities" => "registrations#get_cities", :as => :get_cities_user_registration
          put "/users/get_areas" => "registrations#get_areas", :as => :get_areas_user_registration
          put "/users/set_custom_area" => "registrations#set_custom_area", :as => :set_custom_area_user_registration
          put "/users/set_custom_city" => "registrations#set_custom_city", :as => :set_custom_city_user_registration
          
          put "/users/name" => "registrations#name", :as => :name_user_registration
          put "/users/update_name" => "registrations#update_name", :as => :update_name_user_registration
          
          #put "/users/set_city_by_area" => "registrations#set_city_by_area", :as => :set_city_by_area_user_registration
        end


  resources :adverts do
    collection { post :get_models_by_brand, :set_model, :create_adv, :test_post }
  end
  
  resources :images do
      collection { post :upload_image, :sort }
  end
  
  resources :humans
  
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
