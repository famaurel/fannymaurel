Rails.application.routes.draw do
  scope "(:locale)", locale: /fr|en/ do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "pages#home"
  end
end
