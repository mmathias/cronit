SampleApp1::Application.routes.draw do
  resources :users do 
    collection do 
      get '/signup' => 'users#new'
    end
  end
  resources :businesses do 
    collection do 
      get '/signup' => 'businesses#new'
    end
  end

  resources :sessions,        only: [:new, :create, :destroy]
  resources :calendars,       only: [:create, :destroy]
  resources :products

  root to: 'static_pages#home'
  get '/signin',                      to: 'sessions#new'
  delete '/signout',                     to: 'sessions#destroy'
  get '/help',                        to: 'static_pages#help'
  get '/about',                       to: 'static_pages#about'
  get '/contact',                     to: 'static_pages#contact'
  get '/scheduled_jobs/:id',            to: 'calendars#show',           as: 'scheduled_jobs'
  get '/calendar/:id/calendar_items',   to: 'calendar_items#show',  as: 'show_calendar_items'

end
          