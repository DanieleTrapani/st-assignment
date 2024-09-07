Rails.application.routes.draw do
  devise_for(:users)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get('up' => 'rails/health#show', :as => :rails_health_check)

  unauthenticated do
    devise_scope(:user) do
      root('devise/sessions#new', as: :unauthenticated_root)
    end
  end

  authenticated(:user) do
    root(to: 'pages#redirect', as: :root)
  end

  get('tasks/employee', to: 'tasks#employee', as: :employee_tasks)
  get('tasks/manager', to: 'tasks#manager', as: :manager_tasks)

  post('tasks/:id', to: 'tasks#create', as: :task)
  get('tasks/approve/:id', to: 'tasks#approve', as: :approve_task)
  get('tasks/reject/:id', to: 'tasks#reject', as: :reject_task)
end
