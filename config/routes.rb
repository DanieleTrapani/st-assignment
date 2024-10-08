Rails.application.routes.draw do
  devise_for(:users, skip: %i[registrations password])
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

  get('entries/employee', to: 'entries#employee', as: :employee_entries)
  get('entries/manager', to: 'entries#manager', as: :manager_entries)

  resources(:entries, only: %i[create])
  patch('entries/approve/:id', to: 'entries#approve', as: :approve_entry)
  patch('entries/reject/:id', to: 'entries#reject', as: :reject_entry)
end
