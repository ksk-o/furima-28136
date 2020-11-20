Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items

  devise_scope :user do
    post '/users', to: 'devise/registrations#create', as: :create_user_registration
  end

end
