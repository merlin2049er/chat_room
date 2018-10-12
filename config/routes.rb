Rails.application.routes.draw do
  devise_for :users
  #resources :messages
  resources :rooms, :users do
    resources :messages do
      member { post :vote }
    end
  end

  devise_scope :user do
    authenticated :user do
      root 'rooms#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
