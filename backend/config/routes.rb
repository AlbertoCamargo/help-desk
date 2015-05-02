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

  get 'home' => 'homes#index',           as: :home
  get 'login' => 'sessions#new',         as: :login
  delete 'logout' => 'sessions#destroy', as: :logout 
end
