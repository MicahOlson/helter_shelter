Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :branches, except: [:new, :edit] do
        resources :boarders, except: [:new, :edit]
      end
    end
  end
end
