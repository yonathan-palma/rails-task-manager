Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'tasks', to: 'tasks#index', as: :tasks
  get 'tasks/edit/:id', to: 'tasks#edit', as: :edit_task
  patch 'tasks/:id', to: 'tasks#update'

  get 'tasks/new', to: 'tasks#new', as: :new_task
  post 'tasks', to: 'tasks#create'

  get 'tasks/:id', to: 'tasks#show', as: 'task'

  delete 'tasks/:id', to: 'tasks#destroy'

  # Defines the root path route ("/")
  # root "posts#index"
end
