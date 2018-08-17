Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'
  namespace :api do 
    namespace :v1 do       
      # sessions      
      post 'sign_in', :to => 'sessions#sign_in' 
      post 'sign_up', :to => 'sessions#sign_up'    
      post 'forgot_password', :to => 'sessions#forgot_password' 
      put 'reset_password', :to => 'sessions#reset_password'
      put 'update_password', :to => 'sessions#update_password'
      delete 'sign_out', :to => 'sessions#sign_out'  

      # Property
      post 'add_property', :to => 'properties#create'
      get 'dashboard', :to => 'properties#index'

      # Users
      get 'profile', :to => 'users#profile'
      put 'update', :to => 'users#update'
    end
  end
end
