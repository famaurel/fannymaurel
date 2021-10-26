Rails.application.routes.draw do
  scope "(:locale)", locale: /fr|en/ do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users, controllers: { registrations: "registrations" }
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: 'messages#new'

    resources :projects do
      resources :feedbacks
    end

    resources :messages, only: [:new, :create]

    get "mentions", to: "pages#mentions", as: :mentions

    get "/404", to: "errors#not_found", via: :all
    get "/500", to: "errors#internal_server_error", via: :all
  end
end
