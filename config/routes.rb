Rails.application.routes.draw do
  resources :trips, except: [:new, :update, :edit]
  resources :flights, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  # post '/flights' => 'users#creatflight'
  # patch '/flights/:id' => 'users#updateflight'
end
