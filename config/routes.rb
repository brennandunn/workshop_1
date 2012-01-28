Tweeter::Application.routes.draw do

  get "tweets/edit"

  resources :users, :only => [:update, :create, :destroy] do
    resources :tweets
  end
  get '/newest' => 'users#newest', :as => :newest
  get '/new' => 'users#new', :as => :new_user
  get '/:username' => 'users#show', :as => :user
  root :to => 'users#index'

end
