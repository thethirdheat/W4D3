Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end
  
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  root to: redirect('/cats')
end


#                      users POST   /users(.:format)                                                                         users#create
#                   new_user GET    /users/new(.:format)                                                                     users#new
#                new_session GET    /session/new(.:format)                                                                   sessions#new
#                    session DELETE /session(.:format)                                                                       sessions#destroy
#                            POST   /session(.:format)                                                                       sessions#create