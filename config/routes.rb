Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json }, path: '/' do
    #USER
    post "user", to: "user#create"
    get "user", to: "user#show"
  end
end
