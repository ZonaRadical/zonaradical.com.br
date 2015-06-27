Rails.application.routes.draw do

  concern :sluggable do
    collection do
      get 'slug'
    end
  end

  namespace :api, defaults: {format: :json} do
    scope path: '/discourse_integration', as: :discourse do
      get 'top_menu', to: 'discourse_integration#top_menu', as: :top_menu
    end
  end

  # Resorts
  resources :resorts, path: 'estacoes-ski-snowboard', concerns: :sluggable, except: :show
  get '/resorts/:id', to: 'resorts#resort_redirect', as: :resort_redirect
  get 'estacoes-ski-snowboard/:resort_category_id/:id', to: 'resorts#show', as: :show_resort

  get 'estacoes-ski-snowboard/:id', to: 'resort_categories#show', as: :show_resort_category
  resources :resort_categories, concerns: :sluggable, except: :show

  get '/resorts', to: redirect('/estacoes-ski-snowboard')
  get '/resort_categories/:id', to: redirect('/estacoes-ski-snowboard/%{id}')

  # Tips
  resources :tips, path: 'dicas', concerns: :sluggable, except: :show
  get '/tips/:id', to: 'tips#tip_redirect', as: :tip_redirect
  get 'dicas/:category_id/:id', to: 'tips#show', as: :show_tip

  get 'dicas/:id', to: 'tip_categories#show', as: :show_tip_category
  resources :tip_categories, concerns: :sluggable, except: :show

  get '/tips', to: redirect('/dicas')
  get '/tip_categories/:id', to: redirect('/dicas/%{id}')

  # Videos
  resources :videos, concerns: :sluggable, except: :show
  get 'videos/:category_id/:id', to: 'videos#show', as: :show_video

  get 'videos/:id', to: 'video_categories#show', as: :show_video_category
  resources :video_categories, concerns: :sluggable, except: :show

  resources :breezes, :breeze_categories
  resources :image_galleries, :media_image_categories

  resources :accommodations, :tour_styles
  resources :offers do
    get 'search', on: :collection
  end
  resources :tours, path: '/vamo-junto-snowboard' do
    get 'search', on: :collection
    post 'comment', on: :member
    scope module: 'tours' do
      resources :participants do
        get 'recall', on: :member
      end
    end
  end
  resources :offers, path: '/pacotes-snowboard' do
    scope module: 'offers' do
      resources :participants
    end
  end

  ActiveAdmin.routes(self)

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"

  root 'static_pages#index'

  get '/galera', to: 'static_pages#galera', path: '/contatos'
  get '/friends', to: 'static_pages#friends', path: '/amigos'

  get 'users_controller/finish_signup'

  get '/discourse/sso', to: 'discourse#sso'
  get '/discourse/after_sign_in', to: 'discourse#after_sign_in'
  get '/discourse/logout', to: 'discourse#logout'

  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }
  resources :users do
    scope module: 'users' do
      resources :tours
      resources :offers
    end
  end
  scope '/manage' do
    resources :users do
      resources :image_galleries
      resources :notifications
      patch 'update_password', on: :collection
      resources :tours, module: 'manage'
    end
  end
  namespace :manage do
    resources :tours do
      scope module: 'tours' do
        resources :owners
        resources :participants do
          get :approve, :refuse, on: :member
        end
      end
    end
    resources :offers do
      scope module: 'offers' do
        resources :owners
        resources :participants do
          get :approve, :refuse, on: :member
        end
      end
    end
  end

  match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  match '/user' => 'users#profile', via: [:get], :as => :profile
  match '/user/full_sign_out' => 'users#full_sign_out', via: [:get], :as => :full_sign_out
  match '/athletes' => 'users#athletes', via: [:get], :as => :athletes, path: 'atletas-de-snowboard'
  match '/agencies' => 'users#agencies', via: [:get], :as => :agencies, path: 'agencias-ski-snowboard'
  match '/organizations' => 'users#organizations', via: [:get], :as => :organizations, path: 'ogranizacoes-de-snowboard'

  mount Forem::Engine, :at => '/forum', :as => 'forem'


  # Redirecting old routes
  get '/galera', to: redirect('contatos')
  get '/friends', to: redirect('amigos')
  get '/tours', to: redirect('vamo-junto-snowboard')
  get '/athletes', to: redirect('atletas-de-snowboard')
  get '/agencies', to: redirect('agencias-ski-snowboard')
  get '/organizations', to: redirect('ogranizacoes-de-snowboard')


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
