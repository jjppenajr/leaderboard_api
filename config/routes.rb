Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json }, path: '/' do
    #USER
    post "user", to: "user#create"
    get "user/:id", to: "user#show"

    namespace :admin, path: '/' do
      #BOARD
      post "admin/leaderboard", to: "board#create"
      put "leaderboard/:id/user/:user_id/add_score", to: "board#add_score"
      get "leaderboard/:id", to: "board#leaderboard"
    end
  end
end
