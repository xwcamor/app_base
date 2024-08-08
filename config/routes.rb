Rails.application.routes.draw do

  # Routes For Devise Authentications
  devise_for :accounts, controllers: { 
    registrations: 'accounts/registrations',
    sessions:      'accounts/sessions'
  }
       get 'update_locale/:locale', to: 'application#update_locale', as: :update_locale



  # Asegúrate de que las rutas de devise estén antes de las demás rutas
  namespace :accounts do
    resources :sessions, only: [:index, :create, :destroy]
  end

  # Routes for Public View
  namespace :web, path: '', as: '' do
    root to: 'home#index'
    get 'home/index'
   
    # Otras rutas públicas
    resources :products, only: [:index, :show]
  end

  # Routes for Global Configuration
  namespace :system_management do
    resources :accounts, :languages, :countries, :profiles, :settings, :accesses do
      member do
        get 'delete'
      end
      match 'search',   :via => [:post,:get], :on => :collection      
    end   
  end

  # Routes for Admin View
  namespace :admin_management do
    root to: 'dashboard#index'
    #get 'dashboard/index'
    resources :dashboard, only: [:index]

    # Routes Standar with delete
    resources :profiles, :accounts, :positions, :customers, :employees, :type_payments, :report_payments, :products, :suppliers do
      member do
        get 'delete'
      end
      match 'search',   :via => [:post,:get], :on => :collection
    end
    
    # Routes for Sales with custom actions
    resources :sales do
      member do
        get 'delete'
        get 'cancel_sale'
      end
    end
  end



  
  # Routes for Global Configuration
  namespace :application_management do
    resources :settings do
      member do
        get 'delete'
      end
      match 'search',   :via => [:post,:get], :on => :collection
    end    
  end


end