Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: "performances#index"
  resources :performances, only: [:index, :new, :create, :show] do
    resources :schedules, only: [:new,:create]
    collection do
      get 'search'
    end
  end
  
end
