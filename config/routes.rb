Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recruiters, param: :_username
  post 'auth/login', to: 'authentication#login'

  namespace :recruiter do
    resources :jobs
    resources :submissions
  end

  namespace :publica do
    resources :jobs, only: [:index, :show]
    resources :submissions, only: :create
  end
end
