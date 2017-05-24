Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :lists do
        resources :tasks
      end
    end
  end

  resources :lists
end
