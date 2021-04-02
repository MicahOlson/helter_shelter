Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :branches, except: [:new, :edit] do
    resources :boarders, except: [:new, :edit]
  end
end
