Rails.application.routes.draw do

  root 'sessions#new'

  resources :users
  resources :sessions,            only: :create
  resources :confirmations,       only: :show
  resources :passwords,           except: [:index, :show, :destroy]
  resources :problems,            except: :index
  resources :requests,            except: :index
  resources :incidents,           except: :index
  resources :solutions_problems,  except: :index
  resources :solutions_incidents, except: :index
  resources :solutions_requests,  except: :index
  resources :comments_requests,   except: [:index, :show]
  resources :comments_problems,   except: [:index, :show]
  resources :comments_incidents,  except: [:index, :show]

  get 'home' => 'homes#index',           as: :home
  get 'login' => 'sessions#new',         as: :login
  delete 'logout' => 'sessions#destroy', as: :logout 
  post 'problems/finished/:id' => 'problems#finished'
  post 'problems/open/:id' => 'problems#open'
  post 'requests/finished/:id' => 'requests#finished'
  post 'requests/open/:id' => 'requests#open'
  post 'incidents/finished/:id' => 'incidents#finished'
  post 'incidents/open/:id' => 'incidents#open'
end
